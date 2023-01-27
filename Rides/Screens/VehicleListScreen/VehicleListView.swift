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
    
    @State private var tappedToRetry: Bool = false
    
    @State private var sizeString: String = "10"
    @State private var sorterOption: ListSorterOption = .vin
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    VehicleList(listOfVehicles: viewModel.state.listOfVehicles)
                } header: {
                    VehicleListSearch(sizeString: $sizeString, sorterOption: $sorterOption, onGetListOfRandomVehicles: {
                        guard let size = try? Int(sizeString) else { return }
                        viewModel.getListOfRandomVehicles(size: size, sortedBy: sorterOption)
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
                    errorView
                }
            }
        }
        .accentColor(.white)
    }
    
    private var errorView: some View {
        ErrorView(
            tappedToRetry: $tappedToRetry,
            viewModel: viewModel.state
        )
        .onReceive(Just(tappedToRetry)) { value in
            if value {
                guard let size = try? Int(sizeString) else { return }
                viewModel.getListOfRandomVehicles(size: size, sortedBy: sorterOption)
                tappedToRetry = false
            }
        }
    }
}

struct VehicleListView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleListView(viewModel: VehicleListViewModel())
    }
}

