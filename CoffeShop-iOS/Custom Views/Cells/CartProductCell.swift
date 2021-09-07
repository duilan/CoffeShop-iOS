//
//  CartProductCell.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 05/09/21.
//

import UIKit

class CartProductCell: UITableViewCell {
    static let cellID = "CartProductCell"
    
    private let nameProductLabel = CSTitleLabel(fontSize: 17, fontWeight: .bold, textAlignment: .left)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupNameProductLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with cartProduct: CartProduct) {
        nameProductLabel.text = cartProduct.product.name
    }
    
    private func setup() {
        backgroundColor = CustomColors.backgroundColor
    }
    
    private func setupNameProductLabel() {
        contentView.addSubview(nameProductLabel)
        nameProductLabel.textColor = CustomColors.textPrimaryColor
        nameProductLabel.numberOfLines = 2
        nameProductLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        nameProductLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
}
