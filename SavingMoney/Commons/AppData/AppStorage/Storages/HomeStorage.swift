//
//  HomeStorage.swift
//  LoanTracker
//
//  Created by Tienvv on 14/4/25.
//

import Foundation

class HomeStorage {

    static let shared = HomeStorage()

    private enum Key: String {
        case showMoney
    }

    @AppStorage(Key.showMoney, default: false)
    var isShowMoney: Bool
}
