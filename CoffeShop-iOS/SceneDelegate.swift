//
//  SceneDelegate.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 04/06/21.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private var handleAuthStateListener: AuthStateDidChangeListenerHandle?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        // observer of firebaseAuth - to show the login or home app
        handleAuthStateListener = Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            guard let self = self else { return}
            if user != nil {
                self.window?.rootViewController = self.createTabBarController()
            } else {
                self.window?.rootViewController = self.createOnboardingVC()
            }
        }
        window?.makeKeyAndVisible()
        
    }
    
    private func createOnboardingVC() -> UINavigationController {
        let onboardingVC = OnboardingVC()
        onboardingVC.title = ""
        return UINavigationController(rootViewController: onboardingVC)
    }
    
    private func createTabBarController() -> UITabBarController {
        let tabbar = UITabBarController()
        tabbar.viewControllers = [createHomeNC(),createUserProfileNC()]
        return tabbar
    }
    
    private func createHomeNC() -> UINavigationController {
        let homeVC = HomeVC()
        homeVC.title = "Home"
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }
    
    private func createUserProfileNC() -> UINavigationController {
        let profileVC = ProfileVC()
        profileVC.title = "Profile"
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 3)
        return UINavigationController(rootViewController: profileVC)
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // delete observer of firebaseAuth
        guard let handle = handleAuthStateListener else { return  }
        Auth.auth().removeStateDidChangeListener(handle)
    }
}
