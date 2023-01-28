//
//  VehicleDetailPagingView.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import SwiftUI

struct VehicleDetailPagingView: UIViewControllerRepresentable {
    
    let vehicle: Vehicle
    
    func makeUIViewController(context: Context) -> VehicleDetailPagingViewController {
        VehicleDetailPagingViewController(
            viewModel: VehicleDetailPagingViewModel(vehicle: vehicle)
        )
    }
    
    func updateUIViewController(_ uiViewController: VehicleDetailPagingViewController, context: Context) {}
}
