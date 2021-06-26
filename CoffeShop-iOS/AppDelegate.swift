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
        configureTabbarAppearance()
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
        
        let appearance = UINavigationBarAppearance()
        
        // Remove border and shadow bottom
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .none
        
        // Back Indicator Image
        let backIndicatorImage = UIImage(named: AssetManager.backIndicator)
        appearance.setBackIndicatorImage(backIndicatorImage, transitionMaskImage: backIndicatorImage)
        
        // Background Color
        appearance.backgroundColor = CustomColors.navbarBackgroundColor
        
        // Button Items Color
        UINavigationBar.appearance().tintColor = CustomColors.navbarTextColor
        
        // Text & Color for titles
        appearance.titleTextAttributes = [
            .foregroundColor: CustomColors.navbarTextColor,
            .font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        
        // Text & Color for LargeTitles
        let marginLeftLargeTitle = NSMutableParagraphStyle()
        marginLeftLargeTitle.firstLineHeadIndent = 15 // This is added to the default margin LargeTitles
        appearance.largeTitleTextAttributes = [
            .foregroundColor: CustomColors.navbarTextColor,
            .paragraphStyle : marginLeftLargeTitle
        ]
        
        // Adjust title position
        //appearance.titlePositionAdjustment.vertical = 1
        //appearance.titlePositionAdjustment.horizontal = 0
        
        // Apply the appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    private func configureTabbarAppearance() {
        // Color Tab Bar
        UITabBar.appearance().backgroundColor = CustomColors.tabbarBackgroundColor
        UITabBar.appearance().barTintColor = CustomColors.tabbarBackgroundColor
        UITabBar.appearance().tintColor = CustomColors.tabbarTextColor
    }
}
