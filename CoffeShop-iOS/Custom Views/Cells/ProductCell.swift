//
//  ProductCell.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 28/06/21.
//

import UIKit
import Kingfisher

class ProductCell: UITableViewCell {
    
    // MARK: -  Properties
    static let cellID = "ProductCell"
    private let imageProductView = UIImageView(frame: .zero)
    private let nameProductLabel = CSTitleLabel(fontSize: 17, fontWeight: .bold, textAlignment: .left)
    private let descProductLabel = CSBodyLabel(fontSize: 13, textAlignment: .left)
    private let priceProductLabel = CSTitleLabel(fontSize: 12, fontWeight: .bold, textAlignment: .left)
    private let infoStack = UIStackView()
    
    // MARK: -  Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupImageProduct()
        setupInfoStackProduct()
        setupNameProduct()
        setupDescProduct()
        setupPriceProduct()
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
        descProductLabel.text = product.description
        priceProductLabel.text = product.priceFormatted()
        //Image download using Kingfisher
        let url = URL(string: product.image_url)
        imageProductView.kf.indicatorType = .activity
        imageProductView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
    
    // MARK: -  Private Methods
    private func setup() {
        self.backgroundColor = CustomColors.backgroundColor
        self.selectionStyle = .none
        self.accessoryType = .disclosureIndicator
    }
    
    private func setupImageProduct() {
        contentView.addSubview(imageProductView)
        imageProductView.translatesAutoresizingMaskIntoConstraints = false
        imageProductView.layer.cornerCurve = .continuous
        imageProductView.layer.cornerRadius = 35
        adjustsImageBackgroundInDarkmode()
        //Constrains
        imageProductView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageProductView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageProductView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        imageProductView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupInfoStackProduct() {
        contentView.addSubview(infoStack)
        infoStack.axis = .vertical
        infoStack.distribution = .fillEqually
        infoStack.alignment = .fill
        infoStack.spacing = 0
        infoStack.anchor(top: contentView.topAnchor, left: imageProductView.trailingAnchor, right: contentView.trailingAnchor, bottom: contentView.bottomAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16, paddingBottom: 16, width: 0, height: 0)
    }
    
    private func setupNameProduct() {
        infoStack.addArrangedSubview(nameProductLabel)
        nameProductLabel.textColor = CustomColors.textPrimaryColor
        nameProductLabel.numberOfLines = 2
    }
    
    private func setupDescProduct() {
        infoStack.addArrangedSubview(descProductLabel)
        descProductLabel.numberOfLines = 2
    }
    private func setupPriceProduct() {
        infoStack.addArrangedSubview(priceProductLabel)
    }
    
    private func adjustsImageBackgroundInDarkmode() {
        if self.traitCollection.userInterfaceStyle == .dark {
            imageProductView.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        } else {
            imageProductView.backgroundColor = UIColor.brown.withAlphaComponent(0.1)
        }
    }
    
}
