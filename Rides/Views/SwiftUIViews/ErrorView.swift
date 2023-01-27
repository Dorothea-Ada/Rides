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
            Text("🔥")
                .font(.system(size: 80))
            Text(viewModel.errorMessage ?? "")
                .multilineTextAlignment(.center)
                .font(.regular18)
                .foregroundColor(.customGrayDark)
            Button {
                tappedToRetry()
            } label: {
                Text("Try again")
                    .font(.bold24)
                    .foregroundColor(.customGrayLight)
            }
        }
        .padding(.all)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(
            viewModel: VehicleListViewModel.State(
                errorMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
            ),
            tappedToRetry: {}
        )
    }
}
