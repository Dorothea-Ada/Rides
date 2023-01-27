//
//  VehicleListSearch.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import SwiftUI
import Combine

struct VehicleListSearch: View {
    
    @Binding var sizeString: String
    @Binding var sorterOption: ListSorterOption
    
    var onGetListOfRandomVehicles: (() -> Void)
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Number of vehicles:")
                TextField("", text: $sizeString)
                    .frame(height: 40)
                    .textFieldStyle(MyTextFieldStyle())
                    .onReceive(Just(sizeString)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.sizeString = filtered
                        }
                    }
                
                Button {
                    onGetListOfRandomVehicles()
                } label: {
                    Image(systemName: "magnifyingglass.circle")
                }
            }
            HStack {
                Text("Sorted by:")
                Picker(selection: $sorterOption) {
                    ForEach(ListSorterOption.allCases) { sorterOption in
                        Text(sorterOption.title).tag(sorterOption)
                    }
                } label: {
                    EmptyView()
                }
                .pickerStyle(.menu)
            }
        }
    }
}

struct VehicleListSearch_Previews: PreviewProvider {
    static var previews: some View {
        VehicleListSearch(
            sizeString: .constant("10"),
            sorterOption: .constant(.vin),
            onGetListOfRandomVehicles: {}
        )
    }
}
