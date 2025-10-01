//
//  Double+.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 1/10/25.
//

import Foundation

extension Double {
    var shortFormatted: String {
        let abs = abs(self)
        if abs >= 1_000_000_000 {
            let formatted = (self / 1_000_000_000).rounded(toPlaces: 2)
            return "\(formatted)B"
        } else if abs >= 1_000_000 {
            let formatted = (self / 1_000_000).rounded(toPlaces: 2)
            return "\(formatted)M"
        } else if abs >= 1_000 {
            let formatted = (self / 1_000).rounded(toPlaces: 2)
            return "\(formatted)K"
        } else {
            let roundedSelf = self.rounded(toDecimalPlaces: 2)
            if roundedSelf == floor(roundedSelf) {
                return String(format: "%.0f", self)
            } else {
                return String(format: "%.2f", self)
            }
        }
    }

    func rounded(toPlaces places: Int) -> String {
        let divisor = pow(10.0, Double(places))
        let roundedValue = (self * divisor).rounded() / divisor
        return roundedValue.truncatingRemainder(dividingBy: 1) == 0
            ? String(format: "%.0f", roundedValue)
            : String(roundedValue)
    }
    
    func toInt() -> Int {
        return Int(self)
    }

    func rounded(toDecimalPlaces places: Int) -> Double {
        let multiplier = pow(10.0, Double(places))
        return (self * multiplier).rounded() / multiplier
    }
}

extension Double {
    func toCurrencyString(locale: Locale) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale
        // remove space and symbol
        formatter.positiveFormat = "¤#,##0.00"
        formatter.negativeFormat = "-¤#,##0.00"
        formatter.currencySymbol = .empty
        let roundedSelf = rounded(toDecimalPlaces: 2)
        if roundedSelf == floor(roundedSelf) {
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 0
        } else {
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
        }
        return formatter.string(from: NSNumber(value: self)) ?? .empty
    }
}
