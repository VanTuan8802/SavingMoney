//
//  DataFreshable.swift
//  RestCountry
//
//  Created by Tuấn Nguyễn on 3/9/25.
//

import Foundation

@MainActor
class DataFreshable: ObservableObject {
    @Published var homeRefresh: Bool = false
}
