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
                    .font(.bold32)
                    .foregroundColor(.customRed)
                HStack(alignment: .lastTextBaseline) {
                    Text("\(CarInfo.vin.rawValue):")
                        .font(.regular18)
                        .foregroundColor(.customGrayDark)
                    Text(viewModel.vin)
                        .font(.regular24)
                        .foregroundColor(.customGrayLight)
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
