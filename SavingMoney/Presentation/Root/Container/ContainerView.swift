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
    @InjectedObject(\.app) private var app: AppManager
    
    @StateObject private var login = Navigation()
    
    @State private var didSetupFirstLanguage: Bool = FirstFlowStorage.shared.didSetupFirstLanguage {
        didSet {
            FirstFlowStorage.shared.didSetupFirstLanguage = didSetupFirstLanguage
        }
    }
    
    @State private var didFinishIntroduction: Bool = FirstFlowStorage.shared.didFinishIntroduction {
        didSet {
            FirstFlowStorage.shared.didFinishIntroduction = didFinishIntroduction
        }
    }
    
    @State private var didFinishPermision: Bool = FirstFlowStorage.shared.didFinishPermision {
        didSet {
            FirstFlowStorage.shared.didFinishPermision = didFinishPermision
        }
    }
    
    @State private var didSelectCurrency: Bool = FirstFlowStorage.shared.didSelectCurrency {
        didSet {
            FirstFlowStorage.shared.didSelectCurrency = didSelectCurrency
        }
    }
    
    @State private var didFisishLogin: Bool = FirstFlowStorage.shared.didFisishLogin {
        didSet {
            FirstFlowStorage.shared.didFisishLogin = didFisishLogin
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
            } else if !didFinishPermision {
                PermissionView(
                    onCompleted: {
                        withAnimation {
                            didFinishPermision = true
                        }
                    }
                )
            } else if !didFisishLogin {
//                LoginView(
//                    onCompleted: {
//                        withAnimation {
//                            didFisishLogin = true
//                        }
//                    }
//                )
                
                NavigationRoot(destination: .login,
                                     navigation: login)
                .onAppear {
                    app.navi = login
                }
            } else if !didSelectCurrency {
                BaseCurrencyView(
                    currencySelected: .default(),
                    isFullScreen: true,
                    onCompleted: {
                        withAnimation {
                            didSelectCurrency = true
                        }
                    }
                )
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContainerView()
}
