//
//  VehicleEmissionsViewModel.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

final class VehicleEmissionsViewModel: VehicleDetailPageViewModelable {

    var dataSource: [VehicleDetailPageDataSourceItem] {[
        .detail(
            DetailCellViewModel(
                carInfo: .kilometrage,
                value: "\(String(vehicle.kilometrage)) km"
            )
        ),
        .detail(
            DetailCellViewModel(
                carInfo: .emissions,
                value: "\(vehicle.emissionsString) carbon units"
            )
        )
    ]}
    
    private let vehicle: Vehicle
    
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }
}
