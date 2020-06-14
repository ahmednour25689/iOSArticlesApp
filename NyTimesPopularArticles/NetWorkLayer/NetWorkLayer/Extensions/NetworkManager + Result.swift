//
//  NetworkManager + Result.swift
//  NetworkLayer
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
public extension NetworkManager {
     enum Result<T, U> {
        case success(T)
        case failure(U)

        public var value: T? {
            if case .success(let value) = self {
                return value
            }
            return nil
        }

        public var error: U? {
            if case .failure(let error) = self {
                return error
            }
            return nil
        }
    }
}
