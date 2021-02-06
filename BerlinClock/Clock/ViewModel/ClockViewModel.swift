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
}
