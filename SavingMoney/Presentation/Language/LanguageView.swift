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
    
    let languages: [LanguageEnum] = [.en, .es, .fr, .hi, .pt]
    
    @State private var selectedLanguage: LanguageEnum = UserDefaultsData.shared.language
    @State private var navigateToIntro = false
    
    init(isFirstLanguage: Bool, onCompleted: (() -> Void)?) {
        _viewModel = StateObject(wrappedValue: LanguageViewModel(isFirstLanguage: isFirstLanguage))
        self.onCompleted = onCompleted
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                headerView
                languageSelectionScrollView
            }
            .background(Color.white)
            .navigationDestination(isPresented: $navigateToIntro) {
                //IntroView().navigationBarHidden(true)
            }
        }
    }
    
    private var headerView: some View {
        HStack {
            if !viewModel.isFirstLanguage {
                backButton
            }
            
            Spacer()
            
            Text(R.l10n.language)
                .font(.custom(R.file.poppinsSemiBoldTtf.name, size: 20))
                .foregroundColor(Color.black)
            
            Spacer()
            
            doneButton
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
        .frame(height: 64)
    }
    
    private var backButton: some View {
        Button(action: {
        }) {
            Image(R.image.buttonBack.name, bundle: nil)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
        }
    }
    
    private var doneButton: some View {
        Button(action: {
            UserDefaultsData.shared.language = selectedLanguage
            if viewModel.isFirstLanguage {
                navigateToIntro = true
            }
        }) {
            Image(R.image.buttonDone.name, bundle: nil)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
        }
    }
    
    private var languageSelectionScrollView: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(languages, id: \.self) { language in
                    languageButton(for: language)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .background(.white)
        }
    }
    
    private func languageButton(for language: LanguageEnum) -> some View {
        Button(action: {
            selectedLanguage = language
        }) {
            HStack {
                Image(language.getImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                
                Text(language.getName)
                    .font(.custom(R.file.poppinsMediumTtf.name, size: 18))
                    .foregroundColor(.color18181B)
                    .padding(.leading, 8)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .frame(height: 52)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        selectedLanguage == language ? .color4F80FC : .colorE6E6E6,
                        lineWidth: 2
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

