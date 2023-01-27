//
//  CustomColor.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import SwiftUI
import UIKit

enum CustomColor {
    
    static let red = Color(red: 150/255, green: 23/255, blue: 14/255)
    
}

extension Color {
    var uiColor: UIColor {
        UIColor(self)
    }
}
