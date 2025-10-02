//
//  TabBarView.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 28/9/25.
//

import SwiftUI
import Factory

struct TabBarView: View {
    @InjectedObject(\.homeNavi) private var homeNavi: Navigation
    @InjectedObject(\.statistic) private var statisticNavi: Navigation
    @InjectedObject(\.budget) private var budgetNavi: Navigation
    @InjectedObject(\.setting) private var settingNavi: Navigation
    @InjectedObject(\.app) private var app: AppManager
    
    @State private var isFirstAppear: Bool = false
    @State private var showOverlay: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Nội dung chính
            TabView(selection: $app.activeTab) {
                NavigationRoot(destination: .home, navigation: homeNavi)
                    .tag(TabBarItem.home)
                    .toolbar(.hidden, for: .tabBar)

                NavigationRoot(destination: .statistic, navigation: statisticNavi)
                    .tag(TabBarItem.statistic)
                    .toolbar(.hidden, for: .tabBar)

                NavigationRoot(destination: .budget, navigation: budgetNavi)
                    .tag(TabBarItem.budget)
                    .toolbar(.hidden, for: .tabBar)

                NavigationRoot(destination: .setting, navigation: settingNavi)
                    .tag(TabBarItem.setting)
                    .toolbar(.hidden, for: .tabBar)
            }

            if app.isShowTabbar {
                TabBarNormalView(
                    selectedTab: $app.activeTab,
                    showOverlay: $showOverlay,
                    onSelect: { tab in didSelectTab(tab) }
                )
                .frame(height: 70)
                .background(Color.white)
            }
        }
        .onAppear {
            guard !isFirstAppear else { return }
            FirstFlowStorage.shared.didOpenFirstApp = true
            isFirstAppear = true
            app.navi = homeNavi
        }
        .blur(radius: showOverlay ? 6 : 0)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }

    private func didSelectTab(_ tab: TabBarItem) {
        switch tab {
        case .home: app.navi = homeNavi
        case .statistic: app.navi = statisticNavi
        case .budget: app.navi = budgetNavi
        case .setting: app.navi = settingNavi
        }
    }
}

#Preview {
    TabBarView()
}
