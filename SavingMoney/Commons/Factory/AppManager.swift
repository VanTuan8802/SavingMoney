//
//  TabbarManager.swift
//  RestCountry
//
//  Created by Tuấn Nguyễn on 3/9/25.
//

import Foundation

@MainActor
class AppManager: ObservableObject {

    /// Navi
    @Published var navi: Navigation = Navigation()

    /// State
    @Published var isInBackground: Bool = false
}
