//
//  Array+Extensions.swift
//  BerlinClock
//
//  Created by Ananth Bhamidipati on 06/02/2021.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
