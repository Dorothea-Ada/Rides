//
//  Requestable.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-26.
//

import Foundation

protocol Requestable {
    var baseURL: URL { get }
    var request: Request { get }
    var urlRequest: URLRequest { get }
}

extension Requestable {
    var defaultRequest: Request {
        Request(baseURL)
    }
    
    var urlRequest: URLRequest {
        request.buildURLRequest()
    }
}
