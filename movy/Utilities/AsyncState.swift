//
//  AsyncState.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 03/04/2025.
//

import Foundation

public enum AsyncState<Data: Equatable>: Equatable {
    case initial
    case loading
    case loaded(Data)
    
    var isLoaded: Bool {
        switch self {
        case .initial, .loading:
            return false
        case .loaded:
            return true
        }
    }
    
    var loadedValue: Data? {
          if case let .loaded(data) = self {
              return data
          }
          return nil
      }
}
