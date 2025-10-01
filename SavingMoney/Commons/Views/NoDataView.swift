//
//  NoDataView.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 29/9/25.
//


import SwiftUI

struct NoDataView: View {
    var text: String = R.l10n.nodata()
    var body: some View {
        VStack {
        
            Text(text)
                .font(.medium14)
                .foregroundStyle(Color.color18181B)
        }
    }
}

#Preview {
    NoDataView()
}
