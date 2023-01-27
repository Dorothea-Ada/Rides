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
        let vc = VehicleDetailViewController()
        vc.viewModel = VehicleDetailViewModel(vehicle: vehicle)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: VehicleDetailViewController, context: Context) {}
}
