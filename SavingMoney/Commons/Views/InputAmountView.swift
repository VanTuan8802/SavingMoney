//
//  InputAmountView.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 1/10/25.
//

import SwiftUI

struct InputAmountView: View {
    var title: String
    var titleFont: Font = .medium14
    var titleColor: Color = Color.color18181B

    @Binding var value: String
    var valueFont: Font = .semibold20
    var valueColor: Color = Color.color4F80FC

    var currency: Currency = Currency.default()
    var currencyFont: Font = .system(size: 16)
    var currencyColor: Color = .secondary

    @FocusState private var focus: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(titleFont)
                .foregroundColor(titleColor)
            
            HStack {
                TextField("0", text: $value)
                    .focused($focus)
                    .keyboardType(.decimalPad)
                    .font(valueFont)
                    .foregroundColor(valueColor)
                    .multilineTextAlignment(.leading)

                Spacer()

                Text(currency.symbol)
                    .font(currencyFont)
                    .foregroundColor(currencyColor)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(height: 44)
            .radius17
            
        }
    }
}
