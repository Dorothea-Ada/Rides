//
//  VehicleListViewModel.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-26.
//

import Foundation
import Combine

protocol VehicleListViewModelable: ObservableObject {
    var state: VehicleListViewModel.State { get }
    
    func getListOfRandomVehicles(sizeString: String, sortedBy sorterOption: ListSorterOption)
}

final class VehicleListViewModel: VehicleListViewModelable {
    
    struct State: ErrorStatable {
        var listOfVehicles = [Vehicle]()
        var isLoadingVehicles = false
        var errorMessage: String?
    }
    
    @Published var state = State()
    
    private var vehicleFetcher: VehicleFetcherable
    private var cancellables = Set<AnyCancellable>()
    
    init(vehicleFetcher: VehicleFetcherable = VehicleFetcher()) {
        self.vehicleFetcher = vehicleFetcher
    }
    
    func getListOfRandomVehicles(sizeString: String, sortedBy sorterOption: ListSorterOption) {
        guard let size = Int(sizeString) else {
            fatalError("Impossible error - Size must be a valid size at this point.")
        }
        
        state.errorMessage = nil
        state.listOfVehicles = []
        state.isLoadingVehicles = true
        
        vehicleFetcher.getListOfRandomVehicles(size: size)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.state.errorMessage = error.errorMessageString
                    self?.state.isLoadingVehicles = false
                }
            } receiveValue: { [weak self] listOfVehicles in
                self?.state.listOfVehicles = ListSorter.sortList(listOfVehicles, by: sorterOption)
                self?.state.isLoadingVehicles = false
            }
            .store(in: &cancellables)
    }
}
