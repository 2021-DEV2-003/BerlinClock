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

}
