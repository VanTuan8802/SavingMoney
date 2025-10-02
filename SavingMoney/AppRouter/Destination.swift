import SwiftUI

enum Destination: Equatable {
    static func == (lhs: Destination, rhs: Destination) -> Bool {
        String(describing: lhs) == String(describing: rhs)
    }
    
    case splash
    case language(_ isFirstLanguage: Bool,
                  onCompleted: (() -> Void)?)
    case intro(onCompleted: (() -> Void))
    case permission(onCompleted: (() -> Void))
    case baseCurrency(_ currency: Currency,
                      isFullScreen: Bool,
                      onCompleted: (() -> Void))
    case login
    case register
    case home
    case statistic
    case budget
    case setting
}

extension Destination {
    var identifier: String {
        switch self {
        case .splash: return "splash"
        case .language: return "language"
        case .intro: return "intro"
        case .baseCurrency: return "baseCurrency"
        case .permission: return "permission"
        case .login: return "login"
        case .register: return "register"
        case .home: return "home"
        case .statistic: return "statistic"
        case .budget: return "budget"
        case .setting: return "setting"
        }
    }
}

extension Navigation {
    @ViewBuilder
    internal func screen(for destinationWrapper: DestinationWrapper) -> some View {
        switch destinationWrapper.destination {
        case .splash:
            SplashView()
        case .language(let isFirstLanguage,
                       let onCompleted):
            LanguageView(isFirstLanguage: isFirstLanguage,
                         onCompleted: onCompleted)
        case .intro(let onCompleted):
            IntroView(onCompleted: onCompleted)
        case .permission(let onCompleted):
            PermissionView(onCompleted: onCompleted)
        case .baseCurrency(let currency,
                           let isFullScreen,
                           let onCompleted):
            BaseCurrencyView(currencySelected: currency,
                             isFullScreen: isFullScreen,
                             onCompleted: onCompleted)
        case .login:
            LoginView()
        case .register:
            RegisterView()
        case .home:
            HomeView()
        case .statistic:
            StatisticView()
        case .budget:
            BudgetView()
        case .setting:
            SettingView()
        }
    }
}
