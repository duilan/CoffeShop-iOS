//
//  CSButtonAddToCart.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 23/07/21.
//

import UIKit

class CSButtonAddToCart: UIButton {
    
    private let titleAmount = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupTitleLabel()
        setupTitleAmount()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitleAmount(_ text: String ) {
        titleAmount.text = text
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        contentHorizontalAlignment = .right
        
        layoutMargins =  UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        contentEdgeInsets =  UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        backgroundColor = UIColor(red: 0.302, green: 0.624, blue: 0.533, alpha: 1)
        setBackgroundColor(UIColor.white.withAlphaComponent(0.3), for: .highlighted)
    }
    
    private func setupTitleLabel() {
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        setTitle("Add to cart", for: .normal)
        setTitleColor(.white, for: .normal)
    }
    
    private func setupTitleAmount() {
        addSubview(titleAmount)
        titleAmount.text = "$0.00"
        titleAmount.textAlignment = .left
        titleAmount.textColor = .white
        titleAmount.font = UIFont.preferredFont(forTextStyle: .headline)
        titleAmount.translatesAutoresizingMaskIntoConstraints = false
        titleAmount.anchor(top: layoutMarginsGuide.topAnchor, left: layoutMarginsGuide.leadingAnchor, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        layer.cornerRadius = (self.bounds.height * 0.8) / 2
        layer.cornerCurve = .continuous
    }
    
}
