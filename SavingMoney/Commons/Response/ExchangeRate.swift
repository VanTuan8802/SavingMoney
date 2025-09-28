//
//  ExchangeRate.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 3/5/25.
//

import Foundation

class ExchangeRate: Decodable {
    let success: Bool
    let message: String?
    let result: Double?
    let rate: Double?
    let time: String?
}
