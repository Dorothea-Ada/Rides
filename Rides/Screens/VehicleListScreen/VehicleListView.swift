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
                    listOfVehicles
                } header: {
                    listSectionHeader
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
    
    private var listSectionHeader: some View {
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
                    guard let size = try? Int(sizeString) else { return }
                    viewModel.getListOfRandomVehicles(size: size, sortedBy: sorterOption)
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
    
    private var listOfVehicles: some View {
        ForEach(viewModel.state.listOfVehicles) { vehicle in
            NavigationLink {
                VehicleDetailView(vehicle: vehicle)
                    .navigationTitle(vehicle.makeAndModel)
            } label: {
                VehicleListRowView(vehicle: vehicle)
            }
        }
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

