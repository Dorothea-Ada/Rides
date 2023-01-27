//
//  Color+.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import SwiftUI

extension Color {
    
    static let customRed = Color(red: 150/255, green: 23/255, blue: 14/255)
    
    var uiColor: UIColor {
        UIColor(self)
    }
}
