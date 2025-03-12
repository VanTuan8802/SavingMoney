//
//  BaseCurrencyView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 6/3/25.
//

import SwiftUI
import Kingfisher

struct BaseCurrencyView: View {
    @State private var currencyModels: [CurrencyModel] = []
    @State private var currencySelected: CurrencyModel = UserDefaultsData.shared.currency
    @State private var searchText: String = ""
    
    @State private var navigateToHome = false

    init() {
        if let currencies: [CurrencyModel] = readJSON(fileName: R.file.currenncyJson.name,
                                                      type: [CurrencyModel].self) {
            _currencyModels = State(initialValue: currencies)
        }
    }
    
    var filteredCurrencies: [CurrencyModel] {
        if searchText.isEmpty {
            return currencyModels
        } else {
            return currencyModels.filter {
                $0.country.localizedCaseInsensitiveContains(searchText) ||
                $0.code.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text(R.l10n.baseCurrency)
                        .font(.custom(R.file.poppinsSemiBoldTtf.name, size: 20))
                        .foregroundColor(Color.black)
                        .padding(.top, 10)
                        .frame(maxWidth: .infinity, alignment: .center) 

                    Button(action: {
                        UserDefaultsData.shared.currency = currencySelected
                        navigateToHome = true
                        UserDefaultsData.shared.nextView = .home
                    }) {
                        Image(R.image.buttonDone.name, bundle: nil)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                    }
                }
                .padding(.horizontal, 16)

                SearchBar(text: $searchText)
                    .padding(.horizontal)

                List(filteredCurrencies, id: \.id) { currency in
                    ZStack {
                        CurrencyItemView(currencyModel: currency,
                                         currencySelected: $currencySelected)
                    }
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        currencySelected = currency
                        UserDefaultsData.shared.currency = currency
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(Color.white)
            }.navigationDestination(isPresented: $navigateToHome) {
                HomeView().navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    BaseCurrencyView()
}
