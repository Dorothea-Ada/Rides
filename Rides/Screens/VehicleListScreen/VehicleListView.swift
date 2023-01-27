//
//  VehicleListView.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-26.
//

import SwiftUI
import Combine

struct VehicleListView<ViewModel>: View where ViewModel: VehicleListViewModelable {
    
    @ObservedObject var viewModel: ViewModel
    
    @State private var sizeString: String = "10"
    @State private var sorterOption: ListSorterOption = .vin
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    VehicleList(listOfVehicles: viewModel.state.listOfVehicles)
                } header: {
                    VehicleListSearch(sizeString: $sizeString, sorterOption: $sorterOption, onGetListOfRandomVehicles: {
                        viewModel.getListOfRandomVehicles(sizeString: sizeString, sortedBy: sorterOption)
                    })
                }
            }
            .listStyle(.plain)
            .navigationTitle("List of Vehicles")
            .navigationBarTitleDisplayMode(.large)
            .preferredColorScheme(.dark)
            .overlay(alignment: .center) {
                if viewModel.state.isLoadingVehicles {
                    ScaledProgressView()
                } else if viewModel.state.errorMessage != nil {
                    ErrorView(
                        viewModel: viewModel.state,
                        tappedToRetry: {
                            viewModel.getListOfRandomVehicles(sizeString: sizeString, sortedBy: sorterOption)
                        }
                    )
                }
            }
        }
        .accentColor(.white)
    }
}

struct VehicleListView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleListView(viewModel: VehicleListViewModel())
    }
}

