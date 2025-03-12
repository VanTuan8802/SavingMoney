//
//  LanguageView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 2/3/25.
//

import SwiftUI

struct LanguageView: View {
    let languegeIntro: Bool
    
    let languages: [LanguageEnum] = [.en, .es, .fr, .hi, .pt]
    
    @State private var selectedLanguage: LanguageEnum = UserDefaultsData.shared.language
    
    @State private var navigateToIntro = false
    
    init(languegeIntro: Bool) {
        self.languegeIntro = languegeIntro
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                headerView
                languageSelectionScrollView
            }
            .background(Color.white)
            .navigationDestination(isPresented: $navigateToIntro) {
                IntroView().navigationBarHidden(true)
            }
        }
    }
    
    private var headerView: some View {
        HStack {
            if !languegeIntro {
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
            navigateToIntro = true
            UserDefaultsData.shared.nextView = .intro
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
                    .foregroundColor(.black1B)
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
                        selectedLanguage == language ? .blue4F : .whiteE6,
                        lineWidth: 2
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    LanguageView(languegeIntro: true)
}
