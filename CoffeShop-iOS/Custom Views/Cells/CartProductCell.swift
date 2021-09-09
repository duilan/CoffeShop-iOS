//
//  CartProductCell.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 05/09/21.
//

import UIKit

class CartProductCell: UITableViewCell {
    static let cellID = "CartProductCell"
    
    private let imageProductView = UIImageView(frame: .zero)
    private let nameProductLabel = CSTitleLabel(fontSize: 17, fontWeight: .bold, textAlignment: .left)
    private let quantityProductLabel = CSTitleLabel(fontSize: 14, fontWeight: .semibold, textAlignment: .center)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupImageProductView()
        setupNameProductLabel()
        setupQuantityProductLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with cartProduct: CartProduct) {
        nameProductLabel.text = cartProduct.product.name
        
        let url = URL(string: cartProduct.product.image)
        imageProductView.kf.indicatorType = .activity
        imageProductView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        
        quantityProductLabel.text = "×\(cartProduct.quantity)"
    }
    
    private func setup() {
        self.backgroundColor = CustomColors.backgroundColor
        self.selectionStyle = .none
        self.accessoryType = .disclosureIndicator
    }
    
    private func setupImageProductView() {
        contentView.addSubview(imageProductView)
        imageProductView.layer.cornerCurve = .continuous
        imageProductView.layer.cornerRadius = 35
        imageProductView.backgroundColor = CustomColors.backgroundColorSecondary
        imageProductView.translatesAutoresizingMaskIntoConstraints = false
        // Constrains
        imageProductView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageProductView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageProductView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        imageProductView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    private func setupQuantityProductLabel() {
        contentView.addSubview(quantityProductLabel)
        quantityProductLabel.backgroundColor = CustomColors.backgroundColorTertiary
        quantityProductLabel.textColor = CustomColors.textPrimaryColor
        quantityProductLabel.numberOfLines = 1
        quantityProductLabel.layer.cornerRadius = 10
        quantityProductLabel.layer.masksToBounds = true
        // Constraints
        quantityProductLabel.bottomAnchor.constraint(equalTo: imageProductView.bottomAnchor, constant: 0).isActive = true
        quantityProductLabel.trailingAnchor.constraint(equalTo: imageProductView.trailingAnchor, constant: 0).isActive = true
        quantityProductLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        quantityProductLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
    }
    
    private func setupNameProductLabel() {
        contentView.addSubview(nameProductLabel)
        nameProductLabel.textColor = CustomColors.textPrimaryColor
        nameProductLabel.numberOfLines = 2
        // Constraints
        nameProductLabel.anchor(top: imageProductView.topAnchor, left: imageProductView.trailingAnchor, right: contentView.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 16, paddingRight: 16, paddingBottom: 0, width: 0, height: 36 )
    }
    
}
