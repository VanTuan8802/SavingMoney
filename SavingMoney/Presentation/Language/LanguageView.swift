//
//  LanguageView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 2/3/25.
//

import SwiftUI
import Factory

struct LanguageView: View {
    @InjectedObject(\.app) internal var app: AppManager
    private var onCompleted: ( () -> Void)? = nil
    
    @StateObject var viewModel: LanguageViewModel
    
    @State private var selectedLanguage: LanguageEnum = LanguageStorage.shared.language
    
    init(isFirstLanguage: Bool, onCompleted: (() -> Void)?) {
        _viewModel = StateObject(wrappedValue: LanguageViewModel(isFirstLanguage: isFirstLanguage))
        self.onCompleted = onCompleted
    }
    
    var body: some View {
        VStack {
            headerView
            languageSelectionScrollView
        }
        .background(Color.white)
        .ignoresSafeArea(.all)
    }
    
    @MainActor @ViewBuilder
    private var headerView: some View {
        BasicHeaderView(
            leadingAction: viewModel.isFirstLanguage ? nil : {
                app.navi.pop()
            },
            title: R.l10n.language(),
            trailingImage: Image(R.image.buttonDone),
            trailingAction: {
                LanguageStorage.shared.language = selectedLanguage
                if viewModel.isFirstLanguage {
                    onCompleted?()
                }
            },
            trailingImageColor: Color.color4F80FC,
            showBack: !viewModel.isFirstLanguage
        )
    }
    
    @MainActor @ViewBuilder
    private var languageSelectionScrollView: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(LanguageEnum.allCases, id: \.self) { language in
                    languageItem(for: language)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .background(.white)
        }
    }
    
    @MainActor @ViewBuilder
    private func languageItem(for language: LanguageEnum) -> some View {
        Button(action: {
            selectedLanguage = language
        }) {
            HStack {
                Image(language.getImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                
                Text(language.getName)
                    .font(.medium14)
                    .foregroundColor(Color.color18181B)
                    .padding(.leading, 8)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .background(.white)
            .radius20
            .roundedCornerWithBorder(
                lineWidth: 1,
                borderColor: selectedLanguage == language ? .color4F80FC : .colorE6E6E6,
                radius: 20
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

