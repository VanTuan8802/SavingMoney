//
//  TabBarNormalView.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 28/9/25.
//

import SwiftUI
import Lottie
import Factory

struct TabBarNormalView: View {
    @Binding var selectedTab: TabBarItem
    @Binding var showOverlay: Bool
    var onSelect: ((TabBarItem) -> Void)?
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white.ignoresSafeArea(edges: .bottom)
            
            VStack(spacing: 0) {
                HStack {
                    TabBarNormalItemView(item: .home, selectedItem: $selectedTab)
                        .onTapGesture { select(.home) }
                    
                    Spacer()
                    
                    TabBarNormalItemView(item: .statistic, selectedItem: $selectedTab)
                        .onTapGesture { select(.statistic) }
                    
                    Spacer()
                    
                    TabBarNormalItemView(item: .budget, selectedItem: $selectedTab)
                        .onTapGesture { select(.budget) }
                    
                    Spacer()
                    
                    TabBarNormalItemView(item: .setting, selectedItem: $selectedTab)
                        .onTapGesture { select(.setting) }
                }
                .frame(height: 64)
            }
            .background(
                Color.white
            )
        }
    }
    
    private func select(_ tab: TabBarItem) {
        if selectedTab != tab {
            onSelect?(tab)
            selectedTab = tab
        }
    }
}

struct TabBarNormalItemView: View {
    let item: TabBarItem
    @Binding var selectedItem: TabBarItem
    
    var body: some View {
        VStack(spacing: 4) {
            (item == selectedItem ? item.iconSelected : item.iconNormal)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            
            Text(item.title)
                .font(item == selectedItem ? .semibold10 : .medium10)
                .foregroundColor(item == selectedItem ? .color5987FD : .colorCDCDCD)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
    }
}

struct NormalHalfArcLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width: CGFloat = rect.width
        let midX = width / 2
        let arcRadius: CGFloat = 30
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: midX - arcRadius, y: 0))
        
        path.addArc(center: CGPoint(x: midX, y: 0),
                    radius: arcRadius,
                    startAngle: .degrees(180),
                    endAngle: .degrees(360),
                    clockwise: true)
        
        path.addLine(to: CGPoint(x: width, y: 0))
        
        return path
    }
}
