//
//  ListSorter.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

struct ListSorter {
    static func sortList(_ list: [Vehicle], by sorterOption: ListSorterOption) -> [Vehicle] {
        switch sorterOption {
        case .vin:
            return list.sorted(by: { v1, v2 in return v1.vin < v2.vin } )
        case .carType:
            return list.sorted(by: { v1, v2 in return v1.carType < v2.carType } )
        }
    }
}
