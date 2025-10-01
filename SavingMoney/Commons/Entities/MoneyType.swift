//
//  MoneyType.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 1/10/25.
//


import Foundation

enum MoneyType: Double, CaseIterable, Equatable {
    case ten = 10
    case fifty = 50
    case oneHundred = 100
    case fiveHundred = 500
    case oneThousand = 1_000
    case fiveThousand = 5_000
    case tenThousand = 10_000
    case fiftyThousand = 50_000
    case oneHundredThousand = 100_000
    case fiveHundredThousand = 500_000
    case oneMillion = 1_000_000
    case tenMillion = 10_000_000
    case oneHundredMillion = 100_000_000
    case threeHundredMillion = 300_000_000
    case fiveHundredMillion = 500_000_000
    case eightHundredMillion = 800_000_000
    case oneBillion = 1_000_000_000
    case fiveBillion = 5_000_000_000
    case tenBillion = 10_000_000_000
    case ninetyNineBillion = 99_000_000_000
}

enum DurationType: Int, CaseIterable {
    case yearly = 1
    case monthly = 2

    var title: String {
        switch self {
        case .yearly:
            return R.l10n.year()
        case .monthly:
            return R.l10n.month()
        }
    }

    static func get(_ value: Int) -> DurationType {
        return DurationType(rawValue: value) ?? .monthly
    }
}

enum DisplayType: Hashable {
    case wallet
    case title
    case amount
    case initialAmount
    case category
    case recurring
    case note
    case date(isReminder: Bool)
    case selectColorIcon
    case selectCurrency
}
