//
//  VehicleDetailView.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import SwiftUI

struct VehicleDetailView: UIViewControllerRepresentable {
    
    let vehicle: Vehicle
    
    func makeUIViewController(context: Context) -> VehicleDetailViewController {
        VehicleDetailViewController(viewModel: VehicleDetailViewModel(vehicle: vehicle))
    }
    
    func updateUIViewController(_ uiViewController: VehicleDetailViewController, context: Context) {}
}
