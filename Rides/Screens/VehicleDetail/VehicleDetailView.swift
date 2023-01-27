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
        let vc = UIStoryboard(name: "VehicleDetailViewController", bundle: .main).instantiateViewController(identifier: "VehicleDetailViewController", creator: { coder -> VehicleDetailViewController? in
            VehicleDetailViewController(coder: coder, viewModel: VehicleDetailViewModel(vehicle: vehicle))
        })
        return vc
    }
    
    func updateUIViewController(_ uiViewController: VehicleDetailViewController, context: Context) {}
}
