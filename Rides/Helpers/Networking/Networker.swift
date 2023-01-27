//
//  Networker.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-26.
//

import Foundation
import Combine

protocol Networkable {
    func get<T: Decodable>(for api: API) -> AnyPublisher<T, NetworkingError>
}

final class Networker: Networkable {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func get<T: Decodable>(for api: API) -> AnyPublisher<T, NetworkingError> {
        return urlSession.dataTaskPublisher(for: api.getRequest().urlRequest)
            .tryMap { (data, response) -> Data in
                if let httpResponse = response as? HTTPURLResponse {
                    guard (200..<300) ~= httpResponse.statusCode else {
                        throw NetworkingError.invalidResponseCode(httpResponse.statusCode)
                    }
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> NetworkingError in
                if let decodingError = error as? DecodingError {
                    print("Decoding \(String(describing: T.self)) failed, reason: \(error)")
                    return NetworkingError.decodingError((decodingError as NSError).debugDescription)
                } else if let error = error as? NetworkingError {
                    return error
                }
                return NetworkingError.genericError(error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
