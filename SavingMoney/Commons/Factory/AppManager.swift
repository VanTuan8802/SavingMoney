//
//  TabbarManager.swift
//  RestCountry
//
//  Created by Tuấn Nguyễn on 3/9/25.
//

import Foundation

@MainActor
class AppManager: ObservableObject {
    
    /// Tabbar
    @Published var isShowTabbar: Bool = true
    @Published var activeTab: TabBarItem = .home

    /// Navi
    @Published var navi: Navigation = Navigation()

    /// State
    @Published var isInBackground: Bool = false
}
