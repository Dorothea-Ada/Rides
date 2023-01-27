//
//  VehicleListRowView.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-26.
//

import SwiftUI

struct VehicleListRowView: View {
    
    let viewModel: VehicleListRowViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.makeAndModel)
                    .font(CustomFont.bold32)
                HStack(alignment: .bottom) {
                    Text("VIN:")
                        .font(CustomFont.extraLight14)
                    Text(viewModel.vin)
                        .font(CustomFont.regular18)
                }
            }

        }
    }
}

struct VehicleListRowView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleListRowView(viewModel: VehicleListRowViewModel.mock)
    }
}
