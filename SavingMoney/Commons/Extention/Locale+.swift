//
//  Locale+.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 1/10/25.
//

import Foundation

extension Locale {
    var isLeftSymbol: Bool {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = self

        let prefix = formatter.positivePrefix ?? ""

        return !prefix.isEmpty && prefix.contains(formatter.currencySymbol)
    }

    var zeroPlaceholder: String {
        return isLeftSymbol ? "\(self.currencySymbol ?? .empty)0" : "0\(self.currencySymbol ?? .empty)"
    }
}
