//
//  VehicleFetcher.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-26.
//

import Foundation
import Combine

protocol VehicleFetcherable: AnyObject {
    var networker: Networkable { get }
    
    func getListOfRandomVehicles(size: Int) -> AnyPublisher<[Vehicle], NetworkingError>
}

final class VehicleFetcher: VehicleFetcherable {
    
    let networker: Networkable
    
    init(networker: Networkable = Networker()) {
        self.networker = networker
    }
    
    func getListOfRandomVehicles(size: Int) -> AnyPublisher<[Vehicle], NetworkingError> {
        networker.get(for: .vehicle(.getListOfRandomVehicles(size: size)))
    }
}
