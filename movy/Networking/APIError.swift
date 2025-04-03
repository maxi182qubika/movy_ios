//
//  APIError.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 02/04/2025.
//


import Foundation

enum APIError: Error {
 
    case unknown
    case generic(Error)
    case authenticationError
    case noResponse
    case cancelled
    case serverError
    case teapot
    
    init(from error: Error) {
        if (error as NSError).code == NSURLErrorCancelled {
            self = .cancelled
        } else if let error = error as? APIError {
            self = error
        } else {
            self = .generic(error)
        }
    }
}
