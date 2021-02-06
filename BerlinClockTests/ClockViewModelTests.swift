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
    
}
