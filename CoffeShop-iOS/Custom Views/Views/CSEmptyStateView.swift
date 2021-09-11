//
//  CSEmptyStateView.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 10/09/21.
//

import UIKit

class CSEmptyStateView: UIView {
    
    private let messageLabel = CSTitleLabel(fontSize: 24, fontWeight: .bold, textAlignment: .center)
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String, imageName: String) {
        super.init(frame: .zero)
        messageLabel.text = message
        imageView.image = UIImage(named: imageName) ?? UIImage(named: AssetManager.logo)
        setup()
    }
    
    private func setup() {
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.9
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        addSubview(messageLabel)
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .tertiaryLabel
        messageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        messageLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
}
