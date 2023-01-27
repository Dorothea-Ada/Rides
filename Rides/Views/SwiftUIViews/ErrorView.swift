//
//  ErrorView.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import SwiftUI

struct ErrorView<ViewModel>: View where ViewModel: ErrorStatable {

    var viewModel: ViewModel
    var tappedToRetry: (() -> Void)
    
    var body: some View {
        VStack(spacing: 16) {
            Text("🛞")
                .font(.system(size: 80))
            Text(viewModel.errorMessage ?? "")
            Button {
                tappedToRetry()
            } label: {
                Text("Try again")
            }
        }
    }
}
