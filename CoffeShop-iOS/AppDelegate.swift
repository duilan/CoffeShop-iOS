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
        
        // Color NavigationBar
        UINavigationBar.appearance().backgroundColor = CustomColors.navbarBackgroundColor
        UINavigationBar.appearance().barTintColor = CustomColors.navbarTextColor
        UINavigationBar.appearance().tintColor = CustomColors.navbarTextColor
        
        // Setup Text NavigationBar
        UINavigationBar.appearance().setTitleVerticalPositionAdjustment(CGFloat(3), for: .default)
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor : CustomColors.navbarTextColor,
            .font: UIFont.systemFont(ofSize: 22, weight: .medium)
        ]
        
        // Color Tab Bar
        UITabBar.appearance().backgroundColor = CustomColors.tabbarBackgroundColor
        UITabBar.appearance().barTintColor = CustomColors.tabbarBackgroundColor
        UITabBar.appearance().tintColor = CustomColors.tabbarTextColor
    }
}
