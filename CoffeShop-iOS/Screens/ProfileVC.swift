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
    private let nameLabel = CSTitleLabel(fontSize: 26, fontWeight: .medium, textAlignment: .center)
    private let emailLabel = CSTitleLabel(fontSize: 22, fontWeight: .regular, textAlignment: .center)
    private let logoutButton = CSButtonPlain("Logout")
    private let userInfoStackView = UIStackView()
    private let firebaseAuth = Auth.auth()
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupUserInfoStackView()
        setupNameLabel()
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
    
    private func setupUserInfoStackView() {
        view.addSubview(userInfoStackView)
        userInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        userInfoStackView.axis = .vertical
        userInfoStackView.distribution = .fillEqually
        userInfoStackView.alignment = .fill
        userInfoStackView.spacing = 0
        userInfoStackView.addArrangedSubview(nameLabel)
        userInfoStackView.addArrangedSubview(emailLabel)
        
        userInfoStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 30, paddingLeft: 30, paddingRight: 30, paddingBottom: 0, width: 0, height: 0)
    }
    
    private func setupNameLabel() {
        nameLabel.text = firebaseAuth.currentUser?.displayName
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupEmailLabel() {
        emailLabel.text = firebaseAuth.currentUser?.email
        emailLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupLogoutButton() {
        view.addSubview(logoutButton)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        logoutButton.anchor(top: userInfoStackView.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 30, paddingLeft: 30, paddingRight: 30, paddingBottom: 0, width: 0, height: 50)
    }
    
}
