//
//  MoneyView.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 1/10/25.
//

import SwiftUI

enum FinanceMoneyType {
    case income
    case expense
    case normal

    var fgColor: Color {
        switch self {
        case .income:
            return Color.color2CC013
        case .expense:
            return Color.color2CC013
        case .normal:
            return .clear
        }
    }
}


struct MoneyView: View {
    @Binding var currency: Currency
    @Binding var isShortFormat: Bool
    @Binding var isHidden: Bool
    private var money: Double
    private var fontSymbol = Font.regular12
    private var fontMoney = Font.regular12
    private var fgColorSymbol = Color.color343434
    private var fgColorMoney = Color.color343434
    private var spacing: CGFloat = 0
    private var alignment: VerticalAlignment = .center
    private var locale: Locale = .current
    private var allowRolling: Bool = false
    private var displayType: FinanceMoneyType = .normal

    init(currency: Binding<Currency>,
         isShortFormat: Binding<Bool> = .constant(false),
         isHidden: Binding<Bool> = .constant(false),
         money: Double,
         fontSymbol: Font = Font.medium14,
         fontMoney: Font = Font.medium14,
         fgColorSymbol: Color = Color.color343434,
         fgColorMoney: Color = Color.color343434,
         spacing: CGFloat = 0,
         alignment: VerticalAlignment = .center,
         allowRolling: Bool = false,
         displayType: FinanceMoneyType = .normal) {
        _currency = currency
        _isShortFormat = isShortFormat
        _isHidden = isHidden
        self.money = money
        self.fontSymbol = fontSymbol
        self.fontMoney = fontMoney
        self.fgColorSymbol = fgColorSymbol
        self.fgColorMoney = fgColorMoney
        self.spacing = spacing
        self.alignment = alignment
        self.locale = Locale(identifier: currency.wrappedValue.identifier)
        self.allowRolling = allowRolling
        self.displayType = displayType
    }

    var body: some View {
        if isHidden {
            Text(AppConstant.moneyHiden)
                .foregroundStyle(fgColorMoney)
                .font(fontMoney)
        } else {
            if locale.isLeftSymbol {
                HStack(alignment: alignment, spacing: spacing) {
                    Text(currency.symbol)
                        .foregroundStyle(getFgColorSymbol())
                        .font(fontSymbol)
                        .offset(y: alignment == .top ? 5 : 0)
                    if #available(iOS 17.0, *), allowRolling {
                        Text(getMoneyFormat())
                            .foregroundStyle(getFgColorMoney())
                            .font(fontMoney)
                            .contentTransition(.numericText(value: money))
                    } else {
                        Text(getMoneyFormat())
                            .foregroundStyle(getFgColorMoney())
                            .font(fontMoney)
                    }
                }
            } else {
                HStack(alignment: alignment, spacing: spacing) {
                    if #available(iOS 17.0, *), allowRolling {
                        Text(getMoneyFormat())
                            .foregroundStyle(getFgColorMoney())
                            .font(fontMoney)
                            .contentTransition(.numericText(value: money))
                    } else {
                        Text(getMoneyFormat())
                            .foregroundStyle(getFgColorMoney())
                            .font(fontMoney)
                    }
                    Text(currency.symbol)
                        .foregroundStyle(getFgColorSymbol())
                        .font(fontSymbol)
                        .offset(y: alignment == .top ? 5 : 0)
                }
            }
        }
    }

    private func getMoneyFormat() -> String {
        if isShortFormat {
            return money.shortFormatted
        } else {
            return money.toCurrencyString(locale: locale)
        }
    }

    private func getFgColorMoney() -> Color {
        switch displayType {
        case .income:
            return displayType.fgColor
        case .expense:
            return displayType.fgColor
        case .normal:
            return fgColorMoney
        }
    }

    private func getFgColorSymbol() -> Color {
        switch displayType {
        case .income:
            return displayType.fgColor
        case .expense:
            return displayType.fgColor
        case .normal:
            return fgColorSymbol
        }
    }
}
