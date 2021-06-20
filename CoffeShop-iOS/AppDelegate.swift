//
//  AppDelegate.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 04/06/21.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureFirebase()
        configureNavigationBarAppearance()
        slowLaunchScreen()
        return true
    }
    
    func configureFirebase() {
        FirebaseApp.configure()
    }
    
    func slowLaunchScreen() {
        sleep(1)
    }
    
    func configureNavigationBarAppearance() {
        // Remove border bottom NavigationBar
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        // Setup BackIndicatorImage NavigationBar
        let image = UIImage(named: AssetManager.backIndicator)
        UINavigationBar.appearance().backIndicatorImage = image
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = image
        
        // Setup Text NavigationBar
        UINavigationBar.appearance().setTitleVerticalPositionAdjustment(CGFloat(3), for: .default)
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor : CustomColors.textNavBarColor,
            .font: UIFont.systemFont(ofSize: 22, weight: .medium)
        ]
        
        // Color NavigationBar
        UINavigationBar.appearance().barTintColor = CustomColors.textNavBarColor
        UINavigationBar.appearance().tintColor = CustomColors.textNavBarColor
    }
}
