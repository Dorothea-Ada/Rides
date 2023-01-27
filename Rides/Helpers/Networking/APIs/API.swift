//
//  API.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-26.
//

enum API {
    case vehicle(VehicleAPI.Endpoint)
    
    func getRequest() -> Requestable {
        switch self {
        case .vehicle(let endpoint):
            return VehicleAPI(endpoint: endpoint)
        }
    }
}

