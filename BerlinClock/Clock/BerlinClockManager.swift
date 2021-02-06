//
//  BerlinClockManager.swift
//  BerlinClock
//
//  Created by Ananth Bhamidipati on 06/02/2021.
//

import Foundation

struct BerlinClockManager {
    
    
    func getSeconds(second: Int) -> String {
        return (second % 2 == 0) ? "Y" : "O"
    }
    
    
}
