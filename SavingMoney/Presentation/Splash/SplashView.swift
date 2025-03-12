//
//  SplashView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 2/3/25.
//

import SwiftUI
import Lottie

struct SplashView: View {
    @State private var navigateToLanguageView = false
    @State private var navigateToIntro = false
    @State private var navigateToPermission = false
    @State private var navigateToLogin = false
    @State private var navigateToCurrency = false
    @State private var navigateToHome = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(R.image.splash.name, bundle: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    Image(R.image.icon.name, bundle: nil)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    Text("Money Manager")
                        .font(.custom(R.file.poppinsSemiBoldTtf.name, size: 24))
                        .foregroundColor(.white)
                }
                
                VStack(spacing: 8) {
                    LottieView(animation: .named(R.file.animationJson.name))
                        .playing()
                        .frame(width: 80, height: 80)
                    
                    Text(R.l10n.thisActionCanContainAds)
                        .font(.custom(R.file.poppinsRegularTtf.name, size: 14))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 120)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    switch UserDefaultsData.shared.nextView {
                    case .language:
                        navigateToLanguageView = true
                    case .intro:
                        navigateToIntro = true
                    case .permission:
                        navigateToPermission = true
                    case .login:
                        navigateToLogin = true
                    case .currency:
                        navigateToCurrency = true
                    case .home:
                        navigateToHome = true
                    }
                }
            }.navigationDestination(isPresented: $navigateToLanguageView) {
                LanguageView(languegeIntro: true).navigationBarHidden(true)
            }
            .navigationDestination(isPresented: $navigateToIntro) {
                IntroView().navigationBarHidden(true)
            }.navigationDestination(isPresented: $navigateToPermission) {
                PermissionView().navigationBarHidden(true)
            }
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView().navigationBarHidden(true)
            }
            .navigationDestination(isPresented: $navigateToCurrency) {
                BaseCurrencyView().navigationBarHidden(true)
            }
            .navigationDestination(isPresented: $navigateToHome) {
                HomeView().navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    SplashView()
}
