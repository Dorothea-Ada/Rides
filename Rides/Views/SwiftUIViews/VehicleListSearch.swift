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
            HStack(alignment: .bottom) {
                Text("Number of vehicles:")
                    .font(.regular18)
                    .foregroundColor(.customGrayDark)
                TextField("", text: $sizeString)
                    .textFieldStyle(MyTextFieldStyle())
                    .onChange(of: sizeString) { _ in
                        sizeStringError = SizeStringValidator.validateSizeString(sizeString)
                    }
                
                Button {
                    onGetListOfRandomVehicles()
                } label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(
                            width: Constants.Design.textFieldHeight,
                            height: Constants.Design.textFieldHeight
                        )
                        .foregroundColor(sizeStringError == nil ? .customRed : .customGrayDarkest)
                }
                .disabled(sizeStringError != nil)
            }
            if let sizeStringError {
                Text(sizeStringError)
                    .lineLimit(1)
                    .minimumScaleFactor(0.9)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
                    .font(.regular18)
                    .foregroundColor(.customRed)
            }
            HStack {
                Text("Sorted by:")
                    .font(.regular18)
                    .foregroundColor(.customGrayDark)
                Picker(selection: $sorterOption) {
                    ForEach(ListSorterOption.allCases) { sorterOption in
                        Text(sorterOption.title)
                            .tag(sorterOption)
                    }
                } label: {
                    EmptyView()
                }
                .pickerStyle(.menu)
            }
        }
        .accentColor(.white)
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
