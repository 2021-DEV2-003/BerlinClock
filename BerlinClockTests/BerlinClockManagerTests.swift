//
//  BerlinClockManagerTests.swift
//  BerlinClockTests
//
//  Created by Ananth Bhamidipati on 06/02/2021.
//

import XCTest
@testable import BerlinClock

class BerlinClockManagerTests: XCTestCase {
    
    var berlinClockManager: BerlinClockManager?
    
    override func setUp() {
        berlinClockManager = BerlinClockManager()
    }

    override func tearDown() {
        berlinClockManager = nil
    }
    
    // MARK: - Seconds
    
    func testGetSeconds() {
        let evenSeconds = berlinClockManager?.getSeconds(second: 00)
        XCTAssertEqual(evenSeconds, "Y")
        let oddSeconds = berlinClockManager?.getSeconds(second: 59)
        XCTAssertEqual(oddSeconds, "O")
    }
    
    // MARK: - Hours
    
    func testGetFiveHoursRow() {
        let hoursOne = berlinClockManager?.getFiveHoursRow(hours: 00)
        XCTAssertEqual(hoursOne, "OOOO")
        let hoursTwo = berlinClockManager?.getFiveHoursRow(hours: 23)
        XCTAssertEqual(hoursTwo, "RRRR")
        let hoursThree = berlinClockManager?.getFiveHoursRow(hours: 02)
        XCTAssertEqual(hoursThree, "OOOO")
        let hoursFour = berlinClockManager?.getFiveHoursRow(hours: 08)
        XCTAssertEqual(hoursFour, "ROOO")
        let hoursFive = berlinClockManager?.getFiveHoursRow(hours: 16)
        XCTAssertEqual(hoursFive, "RRRO")
    }
    
    func testGetBottomHoursRow() {
        let hoursOne = berlinClockManager?.getBottomHoursRow(hours: 00)
        XCTAssertEqual(hoursOne, "OOOO")
        let hoursTwo = berlinClockManager?.getBottomHoursRow(hours: 23)
        XCTAssertEqual(hoursTwo, "RRRO")
        let hoursThree = berlinClockManager?.getBottomHoursRow(hours: 02)
        XCTAssertEqual(hoursThree, "RROO")
        let hoursFour = berlinClockManager?.getBottomHoursRow(hours: 08)
        XCTAssertEqual(hoursFour, "RRRO")
        let hoursFive = berlinClockManager?.getBottomHoursRow(hours: 14)
        XCTAssertEqual(hoursFive, "RRRR")
    }

}
