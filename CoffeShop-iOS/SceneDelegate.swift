//
//  SceneDelegate.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 04/06/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = createOnboardingVC()
        window?.makeKeyAndVisible()
    }
    
    func createOnboardingVC() -> UINavigationController {
        let onboardingVC = OnboardingVC()
        onboardingVC.title = ""
        return UINavigationController(rootViewController: onboardingVC)
    }
}
