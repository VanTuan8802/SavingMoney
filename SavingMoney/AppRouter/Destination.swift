import SwiftUI

enum Destination: Equatable {
    static func == (lhs: Destination, rhs: Destination) -> Bool {
        String(describing: lhs) == String(describing: rhs)
    }
    
    case splash
    case language(_ isFirstLanguage: Bool,
                  onCompleted: (() -> Void)?)
    case intro (onCompleted: (() -> Void))
    case login
    case register
}

extension Destination {
    var identifier: String {
        switch self {
        case .splash: return "splash"
        case .language: return "language"
        case .intro: return "intro"
        case .login: return "login"
        case .register: return "register"
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
                         onCompleted: onCompleted
            )
        case .intro(let onCompleted):
            IntroView(onCompleted: onCompleted)
        case .login:
            LoginView()
        case .register:
            RegisterView()
        }
    }
}
