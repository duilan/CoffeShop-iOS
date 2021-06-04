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
        window?.rootViewController = createOnBoardingVC()
        window?.makeKeyAndVisible()
    }
    
    func createOnBoardingVC() -> UINavigationController {
        let onBoardingVC = UIViewController()
        onBoardingVC.title = "OnBoarding"
        onBoardingVC.view.backgroundColor = .brown
        return UINavigationController(rootViewController: onBoardingVC)
    }
}
