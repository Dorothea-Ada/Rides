//
//  VehicleList.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import SwiftUI

struct VehicleList: View {
    
    var listOfVehicles: [Vehicle]
    
    var body: some View {
        ForEach(listOfVehicles) { vehicle in
            NavigationLink {
                VehicleDetailView(vehicle: vehicle)
                    .navigationTitle(vehicle.makeAndModel)
            } label: {
                VehicleListRowView(
                    viewModel: VehicleListRowViewModel(vin: vehicle.vin, makeAndModel: vehicle.makeAndModel)
                )
            }
        }
    }
}

struct VehicleList_Previews: PreviewProvider {
    static var previews: some View {
        VehicleList(listOfVehicles: [Vehicle.mockVehicle1, Vehicle.mockVehicle2])
    }
}
