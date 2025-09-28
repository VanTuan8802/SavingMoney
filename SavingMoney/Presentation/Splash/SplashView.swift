//
//  SplashView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 2/3/25.
//

import SwiftUI
import Lottie

struct SplashView: View {
    private var onCompleted: (() -> Void)?
    
    init(onCompleted: (() -> Void)? = nil) {
        self.onCompleted = onCompleted
    }
    
    var body: some View {
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
                    .font(.semibold24)
                    .foregroundColor(.white)
            }
            
            LottieView(animation: .named(R.file.animationJson.name))
                .playing()
                .frame(width: 80, height: 80)
                .frame(maxWidth: .infinity)
                .padding(.bottom, 80)
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                onCompleted?()
            }
        }
    }
}

#Preview {
    SplashView()
}
