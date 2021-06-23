//
//  ProfileVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 23/06/21.
//

import UIKit
import FirebaseAuth

class ProfileVC: UIViewController {
    
    // MARK: -  Properties
    private let emailLabel = CSTitleLabel(fontSize: 24, fontWeight: .medium, textAlignment: .center)
    private let logoutButton = CSButtonPlain("Logout")
    private let firebaseAuth = Auth.auth()
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupEmailLabel()
        setupLogoutButton()
    }
    
    // MARK: -  Methods
    private func setup() {
        title = "Profile"
        view.backgroundColor = CustomColors.backgroundColor
    }
    
    @objc private func logoutButtonTapped() {
        // cierra sesion de firebase
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    private func setupEmailLabel() {
        view.addSubview(emailLabel)
        emailLabel.text = firebaseAuth.currentUser?.email
        emailLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 30, paddingLeft: 30, paddingRight: 30, paddingBottom: 0, width: 0, height: 0)
    }
    
    func setupLogoutButton() {
        view.addSubview(logoutButton)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        logoutButton.anchor(top: emailLabel.bottomAnchor, left: emailLabel.leadingAnchor, right: emailLabel.trailingAnchor, bottom: nil, paddingTop: 30, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 50)
    }
    
}
