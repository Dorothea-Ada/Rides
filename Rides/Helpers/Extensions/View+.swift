//
//  View+.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import SwiftUI
import UIKit

extension View {
    func setCustomNavigationBarTitleStyle() -> some View {
        UINavigationBar.appearance().titleTextAttributes = [
            .font: UIFont.bold24,
            .foregroundColor: Color.customRed.uiColor
        ]
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font: UIFont.bold48,
            .foregroundColor: Color.customRed.uiColor
        ]
        
        return self
    }
}
