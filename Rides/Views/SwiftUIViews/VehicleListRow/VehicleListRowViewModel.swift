//
//  VehicleListRowViewModel.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

struct VehicleListRowViewModel {
    let vin: String
    let makeAndModel: String
}

extension VehicleListRowViewModel {
    static let mock = VehicleListRowViewModel(
        vin: Vehicle.mock1.vin,
        makeAndModel: Vehicle.mock1.makeAndModel
    )
}
