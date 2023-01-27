//
//  Font+.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import SwiftUI

extension Font {
    
    static let bold24 = getFont(for: .bold, size: 24)
    static let bold32 = getFont(for: .bold, size: 32)
    
    static let regular18 = getFont(for: .regular, size: 18)
    static let regular24 = getFont(for: .regular, size: 24)
    
    private static func getFont(for fontName: FontName, size: CGFloat) -> Font {
        .custom(fontName.rawValue, size: size)
    }
}
