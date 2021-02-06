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

}
