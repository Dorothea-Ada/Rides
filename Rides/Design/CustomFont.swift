//
//  CustomFont.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-26.
//

import SwiftUI

enum CustomFont {
    
    static let bold32 = getFont(for: .bold, size: 32)
    
    static let regular18 = getFont(for: .regular, size: 18)
    
    static let extraLight14 = getFont(for: .extraLight, size: 14)
    
    enum FontName: String {
        case bold = "Oswald-Bold"
        case regular = "Oswald-Regular"
        case extraLight = "Oswald-ExtraLight"
    }
    
    private static func getFont(for fontName: FontName, size: CGFloat) -> Font {
        .custom(fontName.rawValue, size: size)
    }
}
