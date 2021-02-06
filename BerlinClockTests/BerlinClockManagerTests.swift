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
        let hoursOne = berlinClockManager?.getHoursBlock(hours: 00, isTopRow: true)
        XCTAssertEqual(hoursOne, "OOOO")
        let hoursTwo = berlinClockManager?.getHoursBlock(hours: 23, isTopRow: true)
        XCTAssertEqual(hoursTwo, "RRRR")
        let hoursThree = berlinClockManager?.getHoursBlock(hours: 02, isTopRow: true)
        XCTAssertEqual(hoursThree, "OOOO")
        let hoursFour = berlinClockManager?.getHoursBlock(hours: 08, isTopRow: true)
        XCTAssertEqual(hoursFour, "ROOO")
        let hoursFive = berlinClockManager?.getHoursBlock(hours: 16, isTopRow: true)
        XCTAssertEqual(hoursFive, "RRRO")
    }
    
    func testGetBottomHoursRow() {
        let hoursOne = berlinClockManager?.getHoursBlock(hours: 00, isTopRow: false)
        XCTAssertEqual(hoursOne, "OOOO")
        let hoursTwo = berlinClockManager?.getHoursBlock(hours: 23, isTopRow: false)
        XCTAssertEqual(hoursTwo, "RRRO")
        let hoursThree = berlinClockManager?.getHoursBlock(hours: 02, isTopRow: false)
        XCTAssertEqual(hoursThree, "RROO")
        let hoursFour = berlinClockManager?.getHoursBlock(hours: 08, isTopRow: false)
        XCTAssertEqual(hoursFour, "RRRO")
        let hoursFive = berlinClockManager?.getHoursBlock(hours: 14, isTopRow: false)
        XCTAssertEqual(hoursFive, "RRRR")
    }
    
    // MARK: - Minutes
    
    func testGetTopMinutesRow() {
        let minutesOne = berlinClockManager?.getTopMinutesRow(minutes: 00)
        XCTAssertEqual(minutesOne, "OOOOOOOOOOO")
        let minutesTwo = berlinClockManager?.getTopMinutesRow(minutes: 59)
        XCTAssertEqual(minutesTwo, "YYRYYRYYRYY")
        let minutesThree = berlinClockManager?.getTopMinutesRow(minutes: 04)
        XCTAssertEqual(minutesThree, "OOOOOOOOOOO")
        let minutesFour = berlinClockManager?.getTopMinutesRow(minutes: 23)
        XCTAssertEqual(minutesFour, "YYRYOOOOOOO")
        let minutesFive = berlinClockManager?.getTopMinutesRow(minutes: 35)
        XCTAssertEqual(minutesFive, "YYRYYRYOOOO")
    }
    
    func testGetBottomMinutesRow() {
        let minutesOne = berlinClockManager?.getBottomMinutesRow(minutes: 00)
        XCTAssertEqual(minutesOne, "OOOO")
        let minutesTwo = berlinClockManager?.getBottomMinutesRow(minutes: 59)
        XCTAssertEqual(minutesTwo, "YYYY")
        let minutesThree = berlinClockManager?.getBottomMinutesRow(minutes: 32)
        XCTAssertEqual(minutesThree, "YYOO")
        let minutesFour = berlinClockManager?.getBottomMinutesRow(minutes: 34)
        XCTAssertEqual(minutesFour, "YYYY")
        let minutesFive = berlinClockManager?.getBottomMinutesRow(minutes: 35)
        XCTAssertEqual(minutesFive, "OOOO")
    }

}
