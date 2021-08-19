//
//  CSShopInfoView.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 03/08/21.
//

import UIKit

class CSShopInfoView: UIView {
    
    // MARK: -  Properties
    private let titleLabel = CSTitleLabel(fontSize: 20, fontWeight: .semibold, textAlignment: .left)
    private let addressLabel = CSBodyLabel(fontSize: 15, fontWeight: .regular, textAlignment: .left)
    private let distanceLabel = CSBodyLabel(fontSize: 12, fontWeight: .semibold, textAlignment: .left)
    private let distanceIconView = UIImageView()
    
    // MARK: -  Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupBlurBackground()
        setupTitleLabel()
        setupDistanceIconAndLabel()
        setupAddressLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  Public Methods
    func setInfo(shop: Shop, distance: Double) {
        //set label values
        DispatchQueue.main.async {
            self.titleLabel.text = shop.name
            self.addressLabel.text = shop.address
            self.distanceLabel.text =  String(format: "%.01f km", distance)
        }
    }
    
    // MARK: -  Private Methods
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.cornerRadius = 20
        layer.cornerCurve = .continuous
        backgroundColor = CustomColors.backgroundColorSecondary.withAlphaComponent(0.3)
    }
    
    private func setupBlurBackground() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        addSubview(blurView)
        blurView.anchor(top: topAnchor, left: leadingAnchor, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.textColor = CustomColors.textPrimaryColor
        titleLabel.anchor(top: topAnchor, left: leadingAnchor, right: trailingAnchor, bottom: nil, paddingTop: 15, paddingLeft: 20, paddingRight: 20, paddingBottom: 0, width: 0, height: 28)
    }
    
    
    private func setupDistanceIconAndLabel() {
        addSubview(distanceIconView)
        distanceIconView.image = UIImage(named: AssetManager.distanceBetweenIcon)
        distanceIconView.anchor(top: titleLabel.bottomAnchor, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 0, paddingLeft: 20, paddingRight: 0, paddingBottom: 0, width: 16, height: 15)
        
        addSubview(distanceLabel)
        distanceLabel.textColor = CustomColors.textPrimaryColor
        distanceLabel.anchor(top: titleLabel.bottomAnchor, left: distanceIconView.trailingAnchor, right: trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 5, paddingRight: 20, paddingBottom: 0, width: 0, height: 15)
    }
    
    private func setupAddressLabel() {
        let stack = UIStackView(arrangedSubviews: [addressLabel])
        addSubview(stack)
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .top
        addressLabel.numberOfLines = 3
        stack.anchor(top: distanceLabel.bottomAnchor, left: leadingAnchor, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 5, paddingLeft: 20, paddingRight: 20, paddingBottom: 15, width: 0, height: 0)
    }
    
}
