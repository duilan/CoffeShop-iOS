//
//  RegisterVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 15/06/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegisterVC: UIViewController {
    
    // MARK: -  Properties
    private let titleLabel = CSTitleLabel(fontSize: 36, fontWeight: .medium, textAlignment: .left)
    private let userNameTextField = CSTextField()
    private let emailTextField = CSTextField()
    private let passwordTextField = CSTextField()
    private let createButton = CSButtonFilled("Create")
    private let db = Firestore.firestore()
    
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
            presetCSAlertVC(title: "Info", message: "Enter your username", buttonTitle: "OK")
            return
        }
        
        guard let email = emailTextField.text, email.count >= 6 else {
            presetCSAlertVC(title: "Info", message: "Enter your email", buttonTitle: "OK")
            return
        }
        
        guard let password = passwordTextField.text, password.count >= 6 else {
            presetCSAlertVC(title: "Info", message: "The password must be at least 6 characters long", buttonTitle: "OK")
            return
        }
        
        // Firebase crear usuario
        showLoadingView()
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (authResult, error) in
            guard let self = self else { return }
            self.dismissLoadingView()
            guard let user = authResult?.user, error == nil else {
                print("Error:\(error!.localizedDescription)")
                self.presetCSAlertVC(title: "Info", message: error!.localizedDescription, buttonTitle: "OK")
                return
            }            
            // Guardar nombre de usuario en firestore database
            self.db.collection("users").document(email).setData(["name":name,"createdAt": Date()])
            
            //crea perfil
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = name
            changeRequest.commitChanges(completion: nil)
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
        // ir al login viewcontroller
        if URL.absoluteString == "Login" {
            if let nav = navigationController {
                nav.popToRootViewController(animated: false)
                nav.pushViewController(LoginVC(), animated: true)
                return false
            }
            return false
        }
        return true
    }
}
