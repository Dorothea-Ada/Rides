//
//  VehicleListSearch.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import SwiftUI
import Combine

struct VehicleListSearch: View {
    
    @State var sizeStringError: String?
    
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
                    .onChange(of: sizeString) { _ in
                        sizeStringError = SizeStringValidator.validateSizeString(sizeString)
                    }
                
                Button {
                    onGetListOfRandomVehicles()
                } label: {
                    Image(systemName: "magnifyingglass.circle")
                }
                .disabled(sizeStringError != nil)
            }
            if let sizeStringError {
                Text(sizeStringError)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: false)
                    .frame(maxWidth: .infinity, alignment: .trailing)
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
