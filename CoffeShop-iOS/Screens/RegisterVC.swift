//
//  RegisterVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 15/06/21.
//

import UIKit

class RegisterVC: UIViewController {
    
    // MARK: -  Properties
    private let titleLabel = CSTitleLabel(fontSize: 36, fontWeight: .medium, textAlignment: .left)
    private let userNameTextField = CSTextField()
    private let emailTextField = CSTextField()
    private let passwordTextField = CSTextField()
    
    private lazy var formStack: UIStackView =  {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing =  20
        return stack
    }()
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTitle()
        setupForm()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: -  Private Methods
    private func setup() {
        title = "Register"
        view.backgroundColor = CustomColors.backgroundColor
    }
    
    private func setupTitle() {
        view.addSubview(titleLabel)
        titleLabel.text = "Create Account"
        titleLabel.textColor = CustomColors.titleColor
        // Constrains
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 30, paddingLeft: 30, paddingRight: 30, paddingBottom: 0, width: 0, height: 0)
    }
    
    private func setupForm() {
        view.addSubview(formStack)
        formStack.addArrangedSubview(userNameTextField)
        formStack.addArrangedSubview(emailTextField)
        formStack.addArrangedSubview(passwordTextField)
        //User Name
        userNameTextField.placeholder = "Name"
        userNameTextField.autocapitalizationType = .words
        //Email
        emailTextField.placeholder = "Email"
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        //Password
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        // Constrains
        formStack.anchor(top: titleLabel.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 30, paddingLeft: 30 , paddingRight: 30, paddingBottom: 0, width: 0, height: 0)
        
        userNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
}
