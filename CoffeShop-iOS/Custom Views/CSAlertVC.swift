//
//  CSAlertVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 24/06/21.
//

import UIKit

class CSAlertVC: UIViewController {
    
    // MARK: -  Properties
    private let containerView = UIView()
    private let titleLabel = CSTitleLabel(fontSize: 20, fontWeight: .bold, textAlignment: .center)
    private let messageLabel = CSTitleLabel(fontSize: 16, fontWeight: .regular, textAlignment: .center)
    private let actionButton = CSButtonPlain("Text Button")
    
    private var alertTitle: String
    private var alertMessage: String
    private var buttonTitle: String
    private let padding: CGFloat = 20.0
    
    // MARK: -  Init
    init(title: String, message: String, buttonTitle: String) {
        self.alertTitle = title
        self.alertMessage = message
        self.buttonTitle = buttonTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        setupContainerView()
        setupTitleLabel()
        setupActionButton()
        setupMessageLabel()
    }
    
    // MARK: -  Methods
    @objc private func actionButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    private func setupContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor = CustomColors.backgroundColor
        containerView.layer.cornerRadius = 40
        containerView.layer.cornerCurve = .continuous
        containerView.translatesAutoresizingMaskIntoConstraints = false
        //Constrains
        containerView.heightAnchor.constraint(equalToConstant: 210).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setupTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle
        titleLabel.numberOfLines = 0
        titleLabel.textColor = CustomColors.titleColor
        //Constrains
        titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        titleLabel.anchor(top: containerView.topAnchor, left: containerView.leadingAnchor, right: containerView.trailingAnchor, bottom: nil, paddingTop: padding, paddingLeft: padding, paddingRight: padding, paddingBottom: 0, width: 0, height: 0)
    }
    
    private func setupMessageLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = alertMessage
        messageLabel.numberOfLines = 0
        //Constrains
        messageLabel.anchor(top: titleLabel.bottomAnchor, left: containerView.leadingAnchor, right: containerView.trailingAnchor, bottom: actionButton.topAnchor, paddingTop: padding/2, paddingLeft: padding, paddingRight: padding, paddingBottom: padding, width: 0, height: 0)
    }
    
    private func setupActionButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle, for: .normal)
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        //Constrains
        actionButton.anchor(top: nil, left: containerView.leadingAnchor, right: containerView.trailingAnchor, bottom: containerView.bottomAnchor, paddingTop: 0, paddingLeft: padding, paddingRight: padding, paddingBottom: padding, width: 0, height: 45)
    }
}
