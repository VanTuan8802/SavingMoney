//
//  CurrencyItemView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 8/3/25.
//

import SwiftUI
import Kingfisher

struct CurrencyItemView: View {
    var currencyModel: CurrencyModel
    @Binding var currencySelected: CurrencyModel
    
    var body: some View {
        HStack(spacing: 4) {
            KFImage(URL(string: currencyModel.flag))
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 32)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            Spacer()
                .frame(width: 8)
            
                Text(currencyModel.code)
                    .font(.custom(R.file.poppinsMediumTtf.name, size: 18))
                    .foregroundColor( currencySelected.id == currencyModel.id ? .white : .black)
            
            Text(" - ")
                .font(.custom(R.file.poppinsMediumTtf.name, size: 18))
                .foregroundColor( currencySelected.id == currencyModel.id ? .white : .black)
                
                Text(currencyModel.country)
                    .font(.custom(R.file.poppinsRegularTtf.name, size: 14))
                    .foregroundColor( currencySelected.id == currencyModel.id ? .white : .black)
            
            Spacer()
            
            Text(currencyModel.symbol)
                .font(.custom(R.file.poppinsMediumTtf.name, size: 18))
                .foregroundColor( currencySelected.id == currencyModel.id ? .white : .black)
        }
        .padding()
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(
            currencySelected.id == currencyModel.id
            ? LinearGradient(gradient: Gradient(colors: [Color.blue4F, Color.purple8B]),
                             startPoint: .leading,
                             endPoint: .trailing)
            : LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]),
                             startPoint: .leading,
                             endPoint: .trailing)
        )
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(currencySelected.code == currencyModel.code ? Color.blue : Color.gray.opacity(0.5), lineWidth: 2)
        )
    }
}

#Preview {
    CurrencyItemView(currencyModel: CurrencyModel(id: 152,
                                                  flag: "https://144-202-123-28.nip.io/images/unitedstates.png",
                                                  code: "USD",
                                                  country: "United States",
                                                  symbol: "$"),
                     currencySelected: .constant(CurrencyModel(id: 152,
                                                               flag: "https://144-202-123-28.nip.io/images/unitedstates.png",
                                                               code: "USD",
                                                               country: "United States",
                                                               symbol: "$"))
    )
}
