//
//  Configurable.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

protocol Configurable {
    associatedtype ViewModel
    
    func configure(for viewModel: ViewModel)
}

extension Configurable {
    func configured(for viewModel: ViewModel) -> Self {
        self.configure(for: viewModel)
        return self
    }
}
