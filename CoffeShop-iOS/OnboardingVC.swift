//
//  OnboardingVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 05/06/21.
//

import UIKit

class OnboardingVC: UIViewController {
    
    // MARK: -  Properties
    private let registerButton = CSButtonPlain("Register")
    private let loginButton = CSButtonOutline("Log In")
    private let facebookButton = CSButtonOutline("Connect with Facebook", color: .systemBlue)
    
    private lazy var stackButtonsView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupLayout()
    }
    
    // MARK: -  Methods
    private func setup() {
        view.backgroundColor =  CustomColors.backgroundColor
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupLayout() {
        view.addSubview(stackButtonsView)
        view.addSubview(facebookButton)
        stackButtonsView.addArrangedSubview(registerButton)
        stackButtonsView.addArrangedSubview(loginButton)
        facebookButton.setIcon(name: "facebook-icon")
        
        NSLayoutConstraint.activate([
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            stackButtonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackButtonsView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            stackButtonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackButtonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            facebookButton.topAnchor.constraint(equalTo: stackButtonsView.bottomAnchor, constant: 20),
            facebookButton.leadingAnchor.constraint(equalTo: stackButtonsView.leadingAnchor),
            facebookButton.trailingAnchor.constraint(equalTo: stackButtonsView.trailingAnchor),
            facebookButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
