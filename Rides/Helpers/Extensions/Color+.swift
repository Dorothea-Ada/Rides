//
//  Color+.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import SwiftUI

extension Color {
    
    static let customRed = Color(red: 150/255, green: 23/255, blue: 14/255)
    
    static let customGrayDark = Color(red: 140/255, green: 140/255, blue: 140/255)
    static let customGrayDarkest = Color(red: 70/255, green: 70/255, blue: 70/255)
    
    static let customGrayLight = Color(red: 213/255, green: 212/255, blue: 212/255)
    
    var uiColor: UIColor {
        UIColor(self)
    }
}
