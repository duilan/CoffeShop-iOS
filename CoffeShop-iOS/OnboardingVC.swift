//
//  OnboardingVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 05/06/21.
//

import UIKit

class OnboardingVC: UIViewController {
    
    // MARK: -  Properties
    private let slideView = UIView()
    private let registerButton = CSButtonPlain("Register")
    private let loginButton = CSButtonOutline("Log In")
    private let facebookButton = CSButtonOutline("Connect with Facebook", color: .systemBlue)
    private let titleOnboarding = CSTitleLabel(fontSize: 36, fontWeight: .regular, textAlignment: .center)
    
    private lazy var stackButtonsView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
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
        
        view.addSubview(slideView)
        view.addSubview(titleOnboarding)
        view.addSubview(stackButtonsView)
        view.addSubview(facebookButton)
        
        slideView.backgroundColor = .systemIndigo
        
        titleOnboarding.text = "Get the best coffee\nin town!"
        titleOnboarding.numberOfLines = 2
        titleOnboarding.textColor = CustomColors.primaryColor
        
        stackButtonsView.addArrangedSubview(registerButton)
        stackButtonsView.addArrangedSubview(loginButton)
        facebookButton.setIcon(name: "facebook-icon")
    }
    
    private func setupLayout() {
        slideView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 300)
        
        titleOnboarding.anchor(top: slideView.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 50, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 280, height: 80)
        titleOnboarding.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        stackButtonsView.anchor(top: titleOnboarding.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 50, paddingLeft: 30, paddingRight: 30, paddingBottom: 0, width: 0, height: 50)
        
        facebookButton.anchor(top: stackButtonsView.bottomAnchor, left: stackButtonsView.leadingAnchor, right: stackButtonsView.trailingAnchor, bottom: nil, paddingTop: 20, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 50)
        
    }
    
}

