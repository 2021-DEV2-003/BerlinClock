//
//  BerlinClockManager.swift
//  BerlinClock
//
//  Created by Ananth Bhamidipati on 06/02/2021.
//

import Foundation

struct BerlinClockManager {
    
    private let hoursBlockCount = 4
    
    
    // MARK: - Seconds
    func getSeconds(second: Int) -> String {
        return (second % 2 == 0) ? "Y" : "O"
    }
    
    // MARK: - Hours
    
    func getHoursBlock(hours: Int, isTopRow: Bool) -> String {
        let redHourBlocks = isTopRow ? hours / 5 : hours % 5
        let reminderHours = hoursBlockCount - redHourBlocks
        let buildRedHoursBlocksString = String(repeating: "R", count: redHourBlocks)
        let buildEmptyHoursBlocksString = String(repeating: "O", count: reminderHours)
        return buildRedHoursBlocksString + buildEmptyHoursBlocksString
    }
}
