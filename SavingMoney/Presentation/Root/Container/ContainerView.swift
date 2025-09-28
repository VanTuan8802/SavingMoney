//
//  LanguageViewModel.swift
//  SavingMoney
//
//  Created by VanTuan8802 on 27/9/25.
//

import SwiftUI
import Factory

struct ContainerView: View {
    
    @State private var isSplashShowing: Bool = true
    @State private var isFirstLaunch: Bool = true
    @State private var didStart: Bool = FirstFlowStorage.shared.didStart {
        didSet {
            FirstFlowStorage.shared.didStart = didStart
        }
    }
    @State private var didFinishIntroduction: Bool = FirstFlowStorage.shared.didFinishIntroduction {
        didSet {
            FirstFlowStorage.shared.didFinishIntroduction = didFinishIntroduction
        }
    }
    @State private var didSetupFirstLanguage: Bool = FirstFlowStorage.shared.didSetupFirstLanguage {
        didSet {
            FirstFlowStorage.shared.didSetupFirstLanguage = didSetupFirstLanguage
        }
    }
    
    var body: some View {
        contentView
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                guard !isFirstLaunch, !isSplashShowing else { return }
            }
    }
    
    @ViewBuilder @MainActor
    private var contentView: some View {
        Group {
            if isSplashShowing {
                SplashView(
                    onCompleted: {
                        withAnimation {
                            isSplashShowing = false
                            isFirstLaunch = false
                        }
                    }
                )
            } else if !didSetupFirstLanguage {
                LanguageView(
                    isFirstLanguage: true,
                    onCompleted: {
                        withAnimation {
                            didSetupFirstLanguage = true
                        }
                    }
                )
            } else if !didFinishIntroduction {
                IntroView(
                    onCompleted: {
                        withAnimation {
                            didFinishIntroduction = true
                        }
                    }
                )
            }
            else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContainerView()
}
