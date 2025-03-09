//
//  ReadJsonData.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 8/3/25.
//

import Foundation

func readJSON<T: Decodable>(fileName: String, type: T.Type) -> T? {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
        print("❌ JSON file not found")
        return nil
    }

    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    } catch {
        print("❌ Error decoding JSON: \(error)")
        return nil
    }
}
