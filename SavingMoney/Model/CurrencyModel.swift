//
//  CurrencyModel.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 8/3/25.
//

import Foundation

struct CurrencyModel: Codable {
    let id: Int
    let flag: String
    let code: String
    let country: String
    let symbol: String
}
