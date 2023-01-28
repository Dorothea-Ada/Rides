//
//  EmissionsCalculatorTests.swift
//  RidesTests
//
//  Created by Dorota Belanová on 2023-01-27.
//

import XCTest
@testable import Rides

final class EmissionsCalculatorTests: XCTestCase {

    func testCalculator() {
        var result = EmissionsCalculator.calculateEmissions(for: 4500)
        XCTAssertEqual(result, 4500)
        
        result = EmissionsCalculator.calculateEmissions(for: 5000)
        XCTAssertEqual(result, 5000)
        
        result = EmissionsCalculator.calculateEmissions(for: 0)
        XCTAssertEqual(result, 0)
        
        result = EmissionsCalculator.calculateEmissions(for: 5001)
        XCTAssertEqual(result, 5001.5)
        
        result = EmissionsCalculator.calculateEmissions(for: 6000)
        XCTAssertEqual(result, 6500)
    }
}
