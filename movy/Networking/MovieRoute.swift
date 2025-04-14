//
//  MovieRoute.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 02/04/2025.
//

import Foundation

enum MovieRoute: APIRoute {
    case fetchMovies

    var method: HTTPMethod {
        .get
    }

    var sessionPolicy: APIRouteSessionPolicy {
        .publicDomain
    }

    var path: String {
        "/v1/public/characters"
    }

    var params: JSONDictionary {
        switch self {
        case .fetchMovies:
            return [
                "apikey": "e2e1fc04d1e50f8dc866add65a3e398a",
                "hash": "676e434bc45ce5e5b044abc3f8f8ca99",
                "ts": "1"
            ]
        }
    }
}
