//
//  AppDelegate.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 04/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configureNavigationBarAppearance()
        slowLaunchScreen()
        return true
    }
    
    func slowLaunchScreen() {
        sleep(1)
    }
    
    func configureNavigationBarAppearance() {
        // remove border
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        // change color background, items-buttons and text
        UINavigationBar.appearance().barTintColor = CustomColors.backgroundColor
        UINavigationBar.appearance().tintColor = CustomColors.primaryColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : CustomColors.primaryColor]
    }
}
