//
//  SplashView.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 17/11/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Image(R.image.splash.name, bundle: nil)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack {
                Image(R.image.icon.name, bundle: nil)
                    .resizable()
                    .frame(width: 160, height: 160)
                Text("Money Manager")
                    .font(.custom(R.file.poppinsSemiBoldTtf.name, size: 24))
                    .foregroundColor(.white)
                Text("This action can contain ads")
                    .font(.custom(R.file.poppinsRegularTtf.name, size: 14))
                    .foregroundColor(.white)
            
            }
        }
    }
}


#Preview {
    SplashView()
}
