//
//  VehicleDetailViewModel.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import Foundation

protocol VehicleDetailViewModelable {
    var dataSource: [VehicleDetailViewModel.DataSourceItem] { get }
}

final class VehicleDetailViewModel: VehicleDetailViewModelable {
    
    enum DataSourceItem {
        case detail(DetailCellViewModel)
    }
    
    var dataSource: [VehicleDetailViewModel.DataSourceItem] {[
        .detail(
            DetailCellViewModel(
                carInfo: .vin,
                value: vehicle.vin
            )
        ),
        .detail(
            DetailCellViewModel(
                carInfo: .color,
                value: vehicle.color
            )
        ),
        .detail(
            DetailCellViewModel(
                carInfo: .carType,
                value: vehicle.carType
            )
        )
    ]}
    
    private let vehicle: Vehicle
    
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }
}
