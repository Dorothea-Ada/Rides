//
//  VehicleDetailViewModel.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import Foundation

final class VehicleBasicInfoViewModel: VehicleDetailPageViewModelable {
    
    var dataSource: [VehicleDetailPageDataSourceItem] {[
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
