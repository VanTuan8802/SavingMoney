//
//  Container+.swift
//  RestCountry
//
//  Created by Tuấn Nguyễn on 3/9/25.
//

import Foundation
import Factory

/// App manager
extension Container {
    var app: Factory<AppManager> {
        Factory(self) { @MainActor in
            AppManager()
        }.singleton
    }
}

/// Navigation
extension Container {
    var homeNavi: Factory<Navigation> {
        Factory(self) { @MainActor in
            Navigation()
        }.singleton
    }

    var archiveNavi: Factory<Navigation> {
        Factory(self) { @MainActor in
            Navigation()
        }.singleton
    }
}

/// Tabbar
extension Container {
    var dataRefresh: Factory<DataFreshable> {
        Factory(self) { @MainActor in
            DataFreshable()
        }.singleton
    }
}
