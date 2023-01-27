//
//  ErrorView.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import SwiftUI

struct ErrorView<ViewModel>: View where ViewModel: ErrorStatable {

    @Binding var tappedToRetry: Bool
    var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("🛞")
                .font(.system(size: 80))
            Text(viewModel.errorMessage ?? "")
            Button {
                tappedToRetry = true
            } label: {
                Text("Try again")
            }
        }
    }
}
