//
//  CustomTextFieldStyle.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-26.
//

import SwiftUI

struct MyTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .frame(height: Constants.Design.textFieldHeight)
            .background(
                RoundedRectangle(
                    cornerRadius: Constants.Design.textFieldHeight / 2,
                    style: .continuous
                )
                .stroke(Color.customGrayLight, lineWidth: 2)
            )
    }
}
