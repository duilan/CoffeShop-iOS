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
    private let photoView = UIImageView()
    private let logoutButton = CSButtonFilled("Logout")
    private let userInfoStackView = UIStackView()
    private let firebaseAuth = Auth.auth()
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupPhotoView()
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
    
    private func setupPhotoView() {
        view.addSubview(photoView)
        photoView.image = UIImage(named: AssetManager.logo)
        photoView.contentMode = .scaleAspectFit
        photoView.backgroundColor = CustomColors.backgroundColorSecondary
        photoView.layer.cornerRadius = 50
        photoView.layer.borderColor = CustomColors.primaryColor.cgColor
        photoView.layer.borderWidth = 3
        photoView.clipsToBounds = true
        
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        photoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        photoView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        photoView.widthAnchor.constraint(equalToConstant: 100).isActive = true
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
        
        userInfoStackView.anchor(top: photoView.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 30, paddingLeft: 30, paddingRight: 30, paddingBottom: 0, width: 0, height: 0)
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
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if (traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)) {
            photoView.layer.borderColor = CustomColors.primaryColor.cgColor
        }
    }
    
}
