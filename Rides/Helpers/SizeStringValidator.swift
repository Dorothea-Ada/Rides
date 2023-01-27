//
//  VehicleSizeValidator.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

struct SizeStringValidator {
    static func validateSizeString(_ sizeString: String) -> String? {
        return [SizeStringRule.isInt, SizeStringRule.isInRange].compactMap({ $0.check(sizeString) }).first
    }
}

fileprivate struct SizeStringRule {
    
    enum LocalConstants {
        static let minSize: Int = 1
        static let maxSize: Int = 100
    }
    
    let check: (String) -> String?
    
    static let isInt = SizeStringRule {
        Int($0) == nil
            ? "Number of vehicles must be an integer"
            : nil
    }
    
    static let isInRange = SizeStringRule {
        let size: Int = Int($0) ?? .max
        return (size < LocalConstants.minSize || size > LocalConstants.maxSize)
            ? "Number of vehicles must be a value from \(LocalConstants.minSize) to \(LocalConstants.maxSize)"
            : nil
    }
}
