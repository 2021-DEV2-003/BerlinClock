//
//  BerlinClockManager.swift
//  BerlinClock
//
//  Created by Ananth Bhamidipati on 06/02/2021.
//

import Foundation

struct BerlinClockManager {
    
    private let hoursBlocksCount = 4
    private let topMinutesBlocksCount = 11
    private let totalBottomMinutesBlocksCount = 4
    
    // MARK: - BerlinClock
    
    public func getBerlinClockTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        let secondsString = getSeconds(second: seconds)
        let hoursTopRowString = getHoursBlock(hours: hours, isTopRow: true)
        let hoursBottomRowString = getHoursBlock(hours: hours, isTopRow: false)
        let minutesTopRowString = getTopMinutesRow(minutes: minutes)
        let minutesBottomRowString = getBottomMinutesRow(minutes: minutes)
        
        let finalHourString = secondsString + hoursTopRowString + hoursBottomRowString + minutesTopRowString + minutesBottomRowString
        return finalHourString
    }
    
    // MARK: - Seconds
    func getSeconds(second: Int) -> String {
        return (second % 2 == 0) ? "Y" : "O"
    }
    
    // MARK: - Hours
    
    func getHoursBlock(hours: Int, isTopRow: Bool) -> String {
        let redHourBlocks = isTopRow ? hours / 5 : hours % 5
        let reminderHours = hoursBlocksCount - redHourBlocks
        let buildRedHoursBlocksString = String(repeating: "R", count: redHourBlocks)
        let buildEmptyHoursBlocksString = String(repeating: "O", count: reminderHours)
        return buildRedHoursBlocksString + buildEmptyHoursBlocksString
    }
    
    // MARK: - Minutes
    
    func getTopMinutesRow(minutes: Int) -> String {
        let topMinutesBlocks = minutes / 5
        var minutesString = ""
        let minutesBlocksRangeArray = Array(1...topMinutesBlocksCount)
        
        minutesBlocksRangeArray.forEach { (index) in
            if index <= topMinutesBlocks {
                minutesString.append(getMinutesBlockColor(index: index))
            } else {
                minutesString.append("O")
            }
        }
        return minutesString
    }
    
    func getBottomMinutesRow(minutes: Int) -> String {
        let bottomMinutesBlocks = minutes % 5
        let reminderMinutesBlocks = totalBottomMinutesBlocksCount - bottomMinutesBlocks
        let buildYellowMinutesBlocksString = String(repeating: "Y", count: bottomMinutesBlocks)
        let buildEmptyMinutesBlocksString = String(repeating: "O", count: reminderMinutesBlocks)
        return buildYellowMinutesBlocksString + buildEmptyMinutesBlocksString
    }
    
    private func getMinutesBlockColor(index: Int) -> String {
        return (index % 3 == 0) ? "R" : "Y"
    }
}
