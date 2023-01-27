//
//  UIFont+.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import UIKit

extension UIFont {
    
    static let regular18 = getFont(for: .regular, size: 18)
    static let regular24 = getFont(for: .regular, size: 24)
    
    static let bold24 = getFont(for: .bold, size: 24)
    static let bold48 = getFont(for: .bold, size: 48)
    
    private static func getFont(for fontName: FontName, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: fontName.rawValue, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }

        return font
    }
}
