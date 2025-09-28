//
//  CurrencyStorage.swift
//  LoanTracker
//
//  Created by Tienvv on 7/5/25.
//

import Foundation

class CurrencyStorage {

    static let shared = CurrencyStorage()

    private enum Key: String {
        case favorites
    }

    @AppStorage(Key.favorites, default: [])
    var favorites: [Int]
}
