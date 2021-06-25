//
//  LoginVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 21/06/21.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    // MARK: -  Properties
    private let titleLabel = CSTitleLabel(fontSize: 36, fontWeight: .medium, textAlignment: .left)
    private let emailTextField = CSTextField()
    private let passwordTextField = CSTextField()
    private let loginStack = UIStackView()
    private let loginButton = CSButtonPlain("Log In")
    private let dontHaveAccountText = UITextView()
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTitleLabel()
        setupLoginStack()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupDontHaveAccountText()
    }
    
    // dismiss keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: -  Private Methods
    private func setup() {
        title = "Login"
        view.backgroundColor = CustomColors.backgroundColor
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc private func loginButtonTapped() {
        guard let email = emailTextField.text, email.count >= 6 else {
            presetCSAlertVC(title: "Info", message: "Enter your email", buttonTitle: "OK")
            return
        }
        
        guard let password = passwordTextField.text, password.count >= 6 else {
            presetCSAlertVC(title: "Info", message: "The password must be at least 6 characters long", buttonTitle: "OK")
            
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
            guard let _ = authResult?.user, error == nil else {
                print("Error:\(error!.localizedDescription)")
                self?.presetCSAlertVC(title: "Info", message: error!.localizedDescription, buttonTitle: "OK")
                return
            }            
        }
        
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "Welcome back!"
        titleLabel.textColor = CustomColors.titleColor
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 30, paddingLeft: 30, paddingRight: 30, paddingBottom: 0, width: 0, height: 0)
    }
    
    private func setupLoginStack() {
        view.addSubview(loginStack)
        loginStack.axis = .vertical
        loginStack.distribution = .fillEqually
        loginStack.alignment = .fill
        loginStack.spacing = 20
        loginStack.translatesAutoresizingMaskIntoConstraints = false
        loginStack.anchor(top: titleLabel.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 30, paddingLeft: 30, paddingRight: 30, paddingBottom: 0, width: 0, height: 0)
    }
    
    private func setupEmailTextField() {
        loginStack.addArrangedSubview(emailTextField)
        emailTextField.placeholder = "Email"
        emailTextField.keyboardType = .emailAddress
        emailTextField.textContentType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupPasswordTextField() {
        loginStack.addArrangedSubview(passwordTextField)
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .password
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.anchor(top: loginStack.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 60, paddingLeft: 30, paddingRight: 30, paddingBottom: 0, width: 0, height: 50)
    }
    
    private func setupDontHaveAccountText() {
        view.addSubview(dontHaveAccountText)
        dontHaveAccountText.delegate = self
        dontHaveAccountText.textAlignment = .center
        dontHaveAccountText.backgroundColor = .none
        dontHaveAccountText.textColor = .secondaryLabel
        // Hyperlink Register
        dontHaveAccountText.addMultipleLinksToText("Don’t have an account? Register", links: ["Register"], linkColor: CustomColors.primaryColor)
        dontHaveAccountText.anchor(top: loginButton.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 10, paddingLeft: 30, paddingRight: 30, paddingBottom: 0, width: 0, height: 0)
    }
    
}

extension LoginVC: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        // got to register using the Hyperlink viewcontroller
        if URL.absoluteString == "Register" {
            if let nav = navigationController {
                nav.popToRootViewController(animated: false)
                nav.pushViewController(RegisterVC(), animated: true)
                return false
            }
            return false
        }
        return true
    }
}
