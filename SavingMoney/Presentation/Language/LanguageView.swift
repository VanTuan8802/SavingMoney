//
//  LanguageView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 17/11/24.
//

import SwiftUI

struct LanguageView: View {
    let languages: [LanguageEnum] = [.en, .es, .fr, .hi, .pt]
    
    @State private var selectedLanguage: LanguageEnum = UserDefaultsData.shared.language
    
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Back button action
                }) {
                    Image(R.image.buttonBack.name, bundle: nil)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                }
                
                Spacer()
                
                Text("Language")
                    .font(.custom(R.file.poppinsSemiBoldTtf.name, size: 20))
                
                Spacer()
                
                Button(action: {
                    UserDefaultsData.shared.language = selectedLanguage
                }) {
                    Image(R.image.buttonDone.name, bundle: nil)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                }
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
            .frame(height: 64)

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(languages, id: \.self) { language in
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
                            .background(.white
                            )
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
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .background(.white)
            }
        }
    }
}

#Preview {
    LanguageView()
}