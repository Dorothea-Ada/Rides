//
//  EmissionsCalculator.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

struct EmissionsCalculator {
    static func calculateEmissions(for kilometrage: Int) -> Float {
        if kilometrage <= 5000 {
            return Float(kilometrage)
        } else {
            return 5000.0 + (Float(kilometrage) - 5000.0) * 1.5
        }
    }
}
