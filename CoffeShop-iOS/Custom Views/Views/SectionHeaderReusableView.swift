//
//  SectionHeaderReusableView.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 22/08/21.
//

import UIKit

class SectionHeaderReusableView: UICollectionReusableView {
    static let reusableID = "SectionHeaderReusableView"
    private let titleLabel = CSTitleLabel(fontSize: 16, fontWeight: .black, textAlignment: .left)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(title: String) {
        titleLabel.text = title.uppercased()
    }
    
    private func setup() {
        addSubview(titleLabel)
        titleLabel.numberOfLines = 1
        titleLabel.text = "No section title"
        titleLabel.textColor = CustomColors.textPrimaryColor
        titleLabel.anchor(top: topAnchor, left: leadingAnchor, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
    
}
