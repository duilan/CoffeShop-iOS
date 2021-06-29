//
//  ProductCell.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 28/06/21.
//

import UIKit

class ProductCell: UITableViewCell {
    
    // MARK: -  Properties
    static let cellID = "ProductCell"
    private let imageProductView = UIImageView(frame: .zero)
    private let nameProductLabel = CSTitleLabel(fontSize: 20, fontWeight: .medium, textAlignment: .left)
        
    // MARK: -  Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupImageProduct()
        setupNameProduct()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        adjustsImageBackgroundInDarkmode()
    }
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  Public Methods
    public func configure(with product: Product) {
        nameProductLabel.text = product.name
        imageProductView.image = UIImage(named: product.image_url)
    }
    
    // MARK: -  Private Methods
    private func setup() {
        self.backgroundColor = CustomColors.backgroundColor
    }
    
    private func setupImageProduct() {
        #warning("CREATE CUSTOM VIEW FOR IMG WITH URL")
        contentView.addSubview(imageProductView)
        imageProductView.translatesAutoresizingMaskIntoConstraints = false
        imageProductView.layer.cornerCurve = .continuous
        imageProductView.layer.cornerRadius = 35
        adjustsImageBackgroundInDarkmode()
        //Constrains
        imageProductView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageProductView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageProductView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        imageProductView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupNameProduct() {
        contentView.addSubview(nameProductLabel)
        //Constrains
        nameProductLabel.textColor = CustomColors.textPrimaryColor
        nameProductLabel.heightAnchor.constraint(equalToConstant: 40 ).isActive = true
        nameProductLabel.leadingAnchor.constraint(equalTo: imageProductView.trailingAnchor,constant: 16).isActive = true
        nameProductLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true        
    }
    
    private func adjustsImageBackgroundInDarkmode() {
        if self.traitCollection.userInterfaceStyle == .dark {
            imageProductView.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        } else {
            imageProductView.backgroundColor = UIColor.brown.withAlphaComponent(0.1)
        }
    }
    
}
