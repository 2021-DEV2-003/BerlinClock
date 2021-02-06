//
//  ClockViewModel.swift
//  BerlinClock
//
//  Created by Ananth Bhamidipati on 06/02/2021.
//

import Foundation
import UIKit

struct ClockViewModel {
    
    private var clockManager: BerlinClockManager
    
    init(clockManager: BerlinClockManager) {
        self.clockManager = clockManager
    }
    
    func getBerlinTimeColors(hours: Int, minutes: Int, seconds: Int) -> (secondsColor: UIColor, topHours: [UIColor], bottomHours: [UIColor], topMinutes: [UIColor], bottomMinutes: [UIColor]) {
        let code = clockManager.getBerlinClockTimeString(hours: hours, minutes: minutes, seconds: seconds)
        let colors = getColorsFromCodes(code: code)
        
        let secondsColor = getColorForSeconds(colors: colors)
        let hoursTopColors = getColorsForHoursTop(colors: colors)
        let hoursBottomColors = getColorsForHoursBottom(colors: colors)
        let minutesTopColors = getColorsForMinutesTop(colors: colors)
        let minutesBottomColors = getColorsForMinutesBottom(colors: colors)
        return (secondsColor, hoursTopColors, hoursBottomColors, minutesTopColors, minutesBottomColors)
    }
    
    func getColorsFromCodes(code: String) -> [UIColor] {
        var colors: [UIColor] = []
        
        code.forEach { (codeColor) in
            switch codeColor {
                case "Y":
                    colors.append(.yellow)
                case "R":
                    colors.append(.red)
                case  "O":
                    colors.append(.white)
                default:
                    break
            }
        }
        return colors
    }
    
    func getColorForSeconds(colors: [UIColor]) -> UIColor {
        guard let firstColor = colors.first else {
            return .clear
        }
        return firstColor
    }
    
    func getColorsForHoursTop(colors: [UIColor]) -> [UIColor] {
        return Array(colors[1..<5])
    }
    
    func getColorsForHoursBottom(colors: [UIColor]) -> [UIColor] {
        return Array(colors[5..<9])
    }
    
    func getColorsForMinutesTop(colors: [UIColor]) -> [UIColor] {
        return Array(colors[9..<20])
    }
    
    func getColorsForMinutesBottom(colors: [UIColor]) -> [UIColor] {
        return Array(colors[20...23])
    }
}
