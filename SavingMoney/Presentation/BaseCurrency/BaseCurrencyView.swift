//
//  BaseCurrencyView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 6/3/25.
//

import SwiftUI

struct BaseCurrencyView: View {
    
    @StateObject var viewModel: BaseCurrencyViewModel
    private var onCompleted: (() -> Void)?
    
    init(currencySelected: Currency,
         isFullScreen: Bool,
         onCompleted: (() -> Void)?) {
        _viewModel = StateObject(wrappedValue: BaseCurrencyViewModel(isFullScreen: isFullScreen,
                                                                     currencySelected: currencySelected))
        self.onCompleted = onCompleted
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
