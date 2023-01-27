//
//  ListSorterOption.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

enum ListSorterOption: Int, CaseIterable, Identifiable {
    case vin = 0
    case carType
    
    var title: String {
        switch self {
        case .vin:
            return "VIN"
        case .carType:
            return "Car type"
        }
    }
    
    var id: Int { rawValue }
}
