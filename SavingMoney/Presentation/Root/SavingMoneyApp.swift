//
//  SavingMoneyApp.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 28/2/25.
//

import SwiftUI
import FirebaseCore
import IQKeyboardManagerSwift
import Factory

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        IQKeyboardManager.shared.isEnabled = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        return true
    }
}


@main
struct SavingMoneyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
      @Environment(\.scenePhase) var scenePhase
      @InjectedObject(\.app) internal var app: AppManager
    
    var body: some Scene {
        WindowGroup {
            ContainerView()
        }
    }
}
