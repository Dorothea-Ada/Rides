//
//  SizeStringValidatorTests.swift
//  RidesTests
//
//  Created by Dorota Belanová on 2023-01-27.
//

import XCTest
@testable import Rides

final class SizeStringValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidation() {
        XCTAssertNil(SizeStringValidator.validateSizeString("10"))
        XCTAssertNil(SizeStringValidator.validateSizeString("1"))
        XCTAssertNil(SizeStringValidator.validateSizeString("100"))
        XCTAssertNotNil(SizeStringValidator.validateSizeString(""))
        XCTAssertNotNil(SizeStringValidator.validateSizeString("A"))
        XCTAssertNotNil(SizeStringValidator.validateSizeString("1A"))
        XCTAssertNotNil(SizeStringValidator.validateSizeString("-1"))
        XCTAssertNotNil(SizeStringValidator.validateSizeString("0"))
        XCTAssertNotNil(SizeStringValidator.validateSizeString("101"))
    }
}
