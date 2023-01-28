//
//  Vehicle.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-26.
//

import Foundation

struct Vehicle: Decodable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case vin, color, kilometrage
        case makeAndModel = "make_and_model"
        case carType = "car_type"
    }
    
    let vin: String
    let makeAndModel: String
    let color: String
    let carType: String
    let kilometrage: Int
    
    var emissionsString: String {
        String(
            format: "%.1f",
            EmissionsCalculator.calculateEmissions(for: kilometrage)
        )
    }
    
    var id: String {
        vin
    }
}

extension Vehicle {
    static let mock1 = Vehicle(
        vin: "5TGM6KFPP90N06915",
        makeAndModel: "Chevy Malibu",
        color: "Red",
        carType: "Minivan",
        kilometrage: 59763
    )
    
    static let mock2 = Vehicle(
        vin: "VZR06XCPJPP636399",
        makeAndModel: "Dodge Ram",
        color: "Black",
        carType: "Regular Cab Pickup",
        kilometrage: 83948
    )
}
