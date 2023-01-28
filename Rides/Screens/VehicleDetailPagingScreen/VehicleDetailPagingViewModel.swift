//
//  VehicleDetailPagingViewModel.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import Foundation

protocol VehicleDetailPagingViewModelable {
    var vehicle: Vehicle { get }
}

final class VehicleDetailPagingViewModel: VehicleDetailPagingViewModelable {
    
    var vehicle: Vehicle
    
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }
}
