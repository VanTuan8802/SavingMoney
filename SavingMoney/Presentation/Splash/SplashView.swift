//
//  SplashView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 17/11/24.
//

import SwiftUI
import Lottie

struct SplashView: View {
    @State private var navigateToLanguageView = false
    
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
                    LottieView(filename: R.file.animationJson.name, loopMode: .loop)
                        .frame(width: 80, height: 80)
                    
                    Text("This action can contain ads")
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    navigateToLanguageView = true
                }
            }
            .navigationDestination(isPresented: $navigateToLanguageView) {
                LanguageView(languegeIntro: true).navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    SplashView()
}
