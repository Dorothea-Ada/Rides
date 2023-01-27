//
//  NetworkingError.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-26.
//

import Foundation

enum NetworkingError: Error {
    case decodingError(String)
    case genericError(String)
    case invalidResponseCode(Int)
    
    var errorMessageString: String {
        switch self {
        case .decodingError:
            return "Encountered an error while decoding incoming server response. The data couldn’t be read because it isn’t in the correct format."
        case .genericError(let message):
            return message
        case .invalidResponseCode(let responseCode):
            return "Invalid response code encountered from the server. Expected 200, received \(responseCode)"
        }
    }
}
