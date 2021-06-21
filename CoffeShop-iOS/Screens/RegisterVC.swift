//
//  RegisterVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 15/06/21.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {
    
    // MARK: -  Properties
    private let titleLabel = CSTitleLabel(fontSize: 36, fontWeight: .medium, textAlignment: .left)
    private let userNameTextField = CSTextField()
    private let emailTextField = CSTextField()
    private let passwordTextField = CSTextField()
    private let createButton = CSButtonPlain("Create")
    
    private lazy var formStack: UIStackView =  {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing =  20
        return stack
    }()
    
    private lazy var  alreadyHaveAccountText: UITextView = {
        let t = UITextView()
        t.delegate = self
        t.textAlignment = .center
        t.backgroundColor = .none
        t.textColor = .tertiaryLabel
        return t
    }()
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTitle()
        setupForm()
        setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: -  Private Methods
    private func setup() {
        title = "Register"
        view.backgroundColor = CustomColors.backgroundColor
    }
    
    private func setupActions() {
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
    }
    
    @objc private func createButtonTapped() {
        
        guard let name = userNameTextField.text, name.count >= 3 else {
            print("Ingresa tu nombre de usuario")
            return
        }
        
        guard let email = emailTextField.text, email.count >= 6 else {
            print("Introduce tu email")
            return
        }
        
        guard let password = passwordTextField.text, password.count >= 6 else {
            print("Introduce tu contraseña")
            return
        }
        
        // Firebase crear usuario
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error:\(error!.localizedDescription)")
                return
            }
            print("Se registro email: \(user.email!) correctamente")
            #warning("TODO: CHANGE ViewControler destination")
            self?.navigationController?.pushViewController(OnboardingVC(), animated: true)
        }
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
        formStack.addArrangedSubview(createButton)
        view.addSubview(alreadyHaveAccountText)
        
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
        //already have account textview
        alreadyHaveAccountText.addMultipleLinksToText("Already have an account? Login", links: ["Login"], linkColor: CustomColors.primaryColor)
        // Constrains
        formStack.anchor(top: titleLabel.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 30, paddingLeft: 30 , paddingRight: 30, paddingBottom: 0, width: 0, height: 0)
        
        userNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        alreadyHaveAccountText.anchor(top: formStack.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 10, paddingLeft: 30, paddingRight: 30, paddingBottom: 0, width: 0, height: 0)
        
    }
}

// MARK: -  UITextViewDelegate
extension RegisterVC: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        if URL.absoluteString == "Login" {
            #warning("TODO: CHANGE ViewControler destination")
            navigationController?.pushViewController(OnboardingVC(), animated: true)
            return false
        }
        return true
    }
}

