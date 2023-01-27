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
//        .padding(30)
            .frame(height: 40)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.red, lineWidth: 3)
        )
    }
}
