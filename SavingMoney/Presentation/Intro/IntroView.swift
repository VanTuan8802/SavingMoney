//
//  IntroView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 4/3/25.
//

import SwiftUI

struct IntroView: View {
    
    @StateObject var viewModel: IntroViewModel
    private var onCompleted: (() -> Void)?
    
    init(onCompleted: (() -> Void)?) {
        _viewModel = StateObject(wrappedValue: IntroViewModel())
        self.onCompleted = onCompleted
    }
    
    var body: some View {
        TabView(selection: $viewModel.introSelection) {
            ForEach(IntroEnum.allCases, id: \.self) { entity in
                VStack {
                    Image(entity.getImageIntro)
                        .resizable()
                        .scaledToFit()
                    
                    bottomView(entity: entity)
                    
                    Spacer()
                }
                .background(Color.white)
                .tag(entity)
                .ignoresSafeArea()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .ignoresSafeArea()
    }
    
    @MainActor @ViewBuilder
    private func bottomView(entity: IntroEnum) -> some View {
        VStack(spacing: 12) {
            titleView(entity: entity)
            
            actionView
            
            indicator
        }
        .padding(.bottom, 13)
        .background(Color.white)
    }
    
    @MainActor @ViewBuilder
    private func titleView(entity: IntroEnum) -> some View {
        VStack(spacing: 8) {
            Text(entity.getTitle)
                .font(.medium20)
                .fontWeight(.semibold)
                .foregroundColor(Color.color4F80FC)
                .multilineTextAlignment(.center)
            
            Text(entity.getContent)
                .font(.medium14)
                .padding(.horizontal, 16)
                .foregroundColor(Color.color18181B)
                .multilineTextAlignment(.center)
        }
        .padding(.top, 16)
        .padding(.horizontal, 20)
    }
    
    @MainActor @ViewBuilder
    private var actionView: some View {
        Button(
            action: {
                switch viewModel.introSelection {
                case .intro1: viewModel.introSelection = .intro2
                case .intro2: viewModel.introSelection = .intro3
                case .intro3: viewModel.introSelection = .intro4
                case .intro4: onCompleted?()
                }
            },
            label: {
                Text(viewModel.introSelection == .intro4 ? R.l10n.start() : R.l10n.next())
                    .font(.regular16)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.color8B8FEB)
            })
        .padding(.horizontal, 16)
    }
    
    @MainActor @ViewBuilder
    private var indicator: some View {
        HStack(spacing: 8) {
            ForEach(IntroEnum.allCases, id: \.self) { introSelection in
                if introSelection == viewModel.introSelection {
                    LinearGradient(
                        colors: [Color.color4F80FC, Color.color8B8FEB],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: 20, height: 8)
                    .clipShape(Capsule())
                } else {
                    Circle()
                        .fill(Color.colorC5CFF9)
                        .frame(width: 8, height: 8)
                }
            }
        }
    }
}

#Preview {
    IntroView(onCompleted: {
        
    })
}
