//
//  ClockViewModelTests.swift
//  BerlinClockTests
//
//  Created by Ananth Bhamidipati on 06/02/2021.
//

import XCTest
@testable import BerlinClock

class ClockViewModelTests: XCTestCase {

    var clockViewModel: ClockViewModel?
    
    override func setUp() {
        let manager = BerlinClockManager()
        clockViewModel = ClockViewModel(clockManager: manager)
    }

    override func tearDown() {
        clockViewModel = nil
    }
    
    // MARK: - Codes to Colors
    
    func testGetColorsFromCodes() {
        let colorsOne = clockViewModel?.getColorsFromCodes(code: "YOOOOOOOOOOOOOOOOOOOOOOO")
        XCTAssertEqual(colorsOne, [.yellow, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white, .white])
        let colorsTwo = clockViewModel?.getColorsFromCodes(code: "YRRROROOOYYRYYRYYRYOOOOO")
        XCTAssertEqual(colorsTwo, [.yellow, .red, .red, .red, .white, .red, .white, .white, .white, .yellow, .yellow, .red, .yellow, .yellow, .red, .yellow, .yellow, .red, .yellow, .white, .white, .white, .white, .white])
    }
    
}
