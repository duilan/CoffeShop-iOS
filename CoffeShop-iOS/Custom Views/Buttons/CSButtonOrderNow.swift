//
//  CSButtonOrderNow.swift
//  CoffeShop-iOS
//
//  Created by Developer on 21/09/21.
//

import UIKit

class CSButtonOrderNow: UIButton {
    private let totalLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupTitleLabel()
        setupTotalLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTotal(_ total: Double ) {
        totalLabel.text = String(format: "$ %.02f", total)
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        contentHorizontalAlignment = .right
        clipsToBounds = true
        layoutMargins =  UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        contentEdgeInsets =  UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        backgroundColor = UIColor(red: 0.302, green: 0.624, blue: 0.533, alpha: 1)
        setBackgroundColor(UIColor.white.withAlphaComponent(0.3), for: .highlighted)
    }
    
    private func setupTitleLabel() {
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        setTitle("ORDER NOW →", for: .normal)
        setTitleColor(.white, for: .normal)
    }
    
    private func setupTotalLabel() {
        addSubview(totalLabel)
        totalLabel.text = "$ 0.00"
        totalLabel.textAlignment = .left
        totalLabel.textColor = .white
        totalLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.anchor(top: layoutMarginsGuide.topAnchor, left: layoutMarginsGuide.leadingAnchor, right: layoutMarginsGuide.trailingAnchor, bottom: bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
    
}
