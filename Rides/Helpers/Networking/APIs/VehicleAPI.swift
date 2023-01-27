//
//  VehicleAPI.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-26.
//

import Foundation

struct VehicleAPI: Requestable {
    
    enum Endpoint {
        case getListOfRandomVehicles(size: Int)
    }
    
    var baseURL: URL { Constants.VehicleAPI.baseURL }
    
    private let endpoint: Endpoint
    
    init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }
    
    var request: Request {
        switch endpoint {
        case .getListOfRandomVehicles(let size):
            return defaultRequest
                .path("random_vehicle")
                .queryParameters([
                    "size": String(size)
                ])
        }
    }
}
