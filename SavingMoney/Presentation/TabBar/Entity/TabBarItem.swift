//
//  TabBarItem.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 28/9/25.
//

import Foundation
import SwiftUI

enum TabBarItem: Int, Identifiable, CaseIterable, Comparable {

    internal var id: Int { rawValue }

    static func < (lhs: TabBarItem, rhs: TabBarItem) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    case home
    case statistic
    case budget
    case setting

    var title: String {
        switch self {
        case .home:
            return R.l10n.home()
        case .statistic:
            return R.l10n.statistic()
        case .budget:
            return R.l10n.budget()
        case .setting:
            return R.l10n.setting()
        }
    }

    var iconNormal: Image {
        switch self {
        case .home:
            return Image(R.image.home_normal)
        case .statistic:
            return Image(R.image.statistic_normal)
        case .budget:
            return Image(R.image.budget_normal)
        case .setting:
            return Image(R.image.setting_normal)
        }
    }
    
    var iconSelected: Image {
        switch self {
        case .home:
            return Image(R.image.home_seleted)
        case .statistic:
            return Image(R.image.statistic_selected)
        case .budget:
            return Image(R.image.budget_selected)
        case .setting:
            return Image(R.image.statistic_selected)
        }
    }

    var color: Color {
        switch self {
        case .home:
            return .indigo
        case .statistic:
            return .pink
        case .budget:
            return .orange
        case .setting:
            return .teal
        }
    }
}
