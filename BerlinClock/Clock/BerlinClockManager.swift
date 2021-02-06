//
//  BerlinClockManager.swift
//  BerlinClock
//
//  Created by Ananth Bhamidipati on 06/02/2021.
//

import Foundation

struct BerlinClockManager {
    
    private var totalFiveHourBlocks = 4
    private var totalBottomHourBlocks = 4
    
    
    // MARK: - Seconds
    func getSeconds(second: Int) -> String {
        return (second % 2 == 0) ? "Y" : "O"
    }
    
    // MARK: - Hours
    
    func getFiveHoursRow(hours: Int) -> String {
        let redHourBlocks = hours / 5
        let reminderHours = totalFiveHourBlocks - redHourBlocks
        
        let buildRedHours = String(repeating: "R", count: redHourBlocks)
        let buildEmptyHours = String(repeating: "O", count: reminderHours)
        let topHoursRow = buildRedHours + buildEmptyHours
        return topHoursRow
    }
    
    func getBottomHoursRow(hours: Int) -> String {
        let redHourBlocks = hours % 5
        let reminderHours = totalBottomHourBlocks - redHourBlocks
        
        let buildRedHours = String(repeating: "R", count: redHourBlocks)
        let buildEmptyHours = String(repeating: "O", count: reminderHours)
        let bottomHoursRow = buildRedHours + buildEmptyHours
        return bottomHoursRow
    }
}
