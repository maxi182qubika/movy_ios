//
//  ApiClient.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 02/04/2025.
//

import Foundation

protocol APIClientProtocol {
    func fetchMovies() async -> Task<MarvelResponse, Error>
}

final class APIClient: APIClientProtocol {
    
    static let shared = APIClient()
    
    private init() { }
    
    private func checkResponse(_ response: HTTPURLResponse?) throws {
        guard let response = response else { throw APIError.noResponse }
        switch response.statusCode {
        case (200..<299): break
        case 401, 403:
            NotificationCenter.default.post(name: .authenticationError, object: nil, userInfo: nil)
            throw APIError.authenticationError
        case 418: throw APIError.teapot
        case (500..<599): throw APIError.serverError
        default: break
        }
    }
}

// MARK: Callbacks
extension APIClient {
    private func request(_ route: APIRoute, onCompletion: @escaping (Result<Data, APIError>) -> Void) -> URLSessionDataTask? {
        do {
            let session = URLSession.shared.dataTask(with: try route.asURLRequest()) { data, response, error in
                DispatchQueue.main.async {
                    do {
                        try self.checkResponse(response as? HTTPURLResponse)
                        if let error = error {
                            onCompletion(.failure(APIError(from: error)))
                        } else if let data = data {
                            onCompletion(.success(data))
                        } else {
                            onCompletion(.failure(.unknown))
                        }
                    } catch {
                        onCompletion(.failure(error as? APIError ?? .unknown))
                    }
                }
            }
            session.resume()
            return session
        } catch {
            onCompletion(.failure(APIError(from: error)))
            return nil
        }
    }
    
    @discardableResult func request(_ route: APIRoute, onCompletion: @escaping (Result<JSONDictionary, APIError>) -> Void) -> URLSessionDataTask? {
        request(route) { (result: Result<Data, APIError>) in
            switch result {
            case .success(let data):
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? JSONDictionary else {
                        onCompletion(.failure(.unknown))
                        return
                    }
                    onCompletion(.success(json))
                } catch {
                    onCompletion(.failure(APIError(from: error)))
                }
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
    
    @discardableResult func request<T: Decodable>(_ route: APIRoute,
                                                  onCompletion: @escaping (Result<T, APIError>) -> Void) -> URLSessionDataTask? {
        request(route) { (result: Result<Data, APIError>) in
            switch result {
            case .success(let data):
                do {
                    onCompletion(.success(try JSONDecoder().decode(T.self, from: data)))
                } catch {
                    onCompletion(.failure(APIError(from: error)))
                }
            case .failure(let error): onCompletion(.failure(error))
            }
        }
    }
}

// MARK: Concurrency
extension APIClient {
    private func request(_ route: APIRoute) async -> Task<Data, Error> {
        Task { () -> Data in
            let request = try route.asURLRequest()
            logRequest(request)
            let (data, response) = try await URLSession.shared.data(for: request)
            try checkResponse(response as? HTTPURLResponse)
            return data
        }
    }
    
    @discardableResult func request(_ route: APIRoute) async -> Task<JSONDictionary, Error> {
        Task { () -> JSONDictionary in
            let data: Data = try await request(route).value
            try Task.checkCancellation()
            guard let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? JSONDictionary else {
                throw APIError.unknown
            }
            return json
        }
    }
    
    @discardableResult func request<T: Decodable>(_ route: APIRoute) -> Task<T, Error> {
        Task { () -> T in
            let data: Data = try await request(route).value
            try Task.checkCancellation()
            return try JSONDecoder().decode(T.self, from: data)
        }
    }
}

private func logRequest(_ request: URLRequest) {
    print("➡️ [HTTP REQUEST]")
    print("URL: \(request.url?.absoluteString ?? "nil")")
    print("Method: \(request.httpMethod ?? "nil")")
    print("Headers: \(request.allHTTPHeaderFields ?? [:])")
    if let body = request.httpBody,
       let bodyString = String(data: body, encoding: .utf8) {
        print("Body: \(bodyString)")
    } else {
        print("Body: nil")
    }
}

extension Notification.Name {
    static let authenticationError = Notification.Name("authenticationError")
}

extension URLSession {
    @available(iOS, deprecated: 15.0, message: "This extension is no longer necessary. Use API built into SDK")
    func data(from url: URL) async throws -> (Data, URLResponse) {
        try await withCheckedThrowingContinuation { continuation in
            let task = self.dataTask(with: url) { data, response, error in
                guard let data = data, let response = response else {
                    let error = error ?? URLError(.badServerResponse)
                    return continuation.resume(throwing: error)
                }
                continuation.resume(returning: (data, response))
            }
            task.resume()
        }
    }
}
