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
    private let totalProductLabel = CSTitleLabel(fontSize: 14, fontWeight: .bold, textAlignment: .right)
    private let customizationsProductLabel = CSBodyLabel(fontSize: 14, fontWeight: .regular, textAlignment: .left)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupImageProductView()
        setupQuantityProductLabel()
        setupInfoStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with cartProduct: CartProduct) {
        //name
        nameProductLabel.text = cartProduct.product.name
        // image
        let url = URL(string: cartProduct.product.image)
        imageProductView.kf.indicatorType = .activity
        imageProductView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        //quantity & total
        quantityProductLabel.text = "×\(cartProduct.quantity)"
        totalProductLabel.text = cartProduct.totalFormatted()
        //Customizations description ✓ ✗
        var textCustomization = ""
        for customization in cartProduct.product.customizations {
            let typeCustomization = customization.type
            let customization = customization.options[customization.optionSelected]
            let icon = customization.desc == "No" ? "✗" : "✓"
            textCustomization += "\(icon) \(typeCustomization): \(customization.desc)\n"
        }
        self.customizationsProductLabel.text = textCustomization.trimmingCharacters(in: .newlines)
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
        imageProductView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19).isActive = true
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
    
    private func setupInfoStackView() {
        let infoStackView = UIStackView(arrangedSubviews: [nameProductLabel,customizationsProductLabel,totalProductLabel])
        contentView.addSubview(infoStackView)
        
        nameProductLabel.textColor = CustomColors.textPrimaryColor
        nameProductLabel.numberOfLines = 2
        customizationsProductLabel.numberOfLines = 0
        totalProductLabel.numberOfLines = 1
        
        infoStackView.axis = .vertical
        infoStackView.distribution = .fillProportionally
        infoStackView.alignment = .fill
        infoStackView.spacing = 5
        
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        infoStackView.leadingAnchor.constraint(equalTo: imageProductView.trailingAnchor, constant: 16).isActive = true
        infoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        infoStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 105).isActive = true
    }
    
}
