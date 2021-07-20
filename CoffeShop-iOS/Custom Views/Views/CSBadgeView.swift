//
//  CSBadgeView.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 19/07/21.
//

import UIKit

class CSBadgeView: UIView {

    private let titleLabel = CSTitleLabel(fontSize: 13, fontWeight: .semibold, textAlignment: .center)    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    private func setup(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = CustomColors.backgroundColorTertiary
        layer.cornerRadius = 15
        layer.cornerCurve = .continuous
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)        
        titleLabel.textColor = CustomColors.textPrimaryColor        
        titleLabel.anchor(top: topAnchor, left: leadingAnchor, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 8, paddingLeft: 32, paddingRight: 32, paddingBottom: 8, width: 0, height: 0)
    }    

}
