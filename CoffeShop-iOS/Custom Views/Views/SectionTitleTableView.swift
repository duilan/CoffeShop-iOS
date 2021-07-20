//
//  SectionTitleTableView.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 19/07/21.
//

import UIKit

class SectionTitleTableView: UIView {
    private let titleBadge = CSBadgeView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    init(title: String) {
        super.init(frame: .zero)
        titleBadge.setTitle(title)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = CustomColors.backgroundColorSecondary
        addSubview(titleBadge)
        titleBadge.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleBadge.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleBadge.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        titleBadge.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}
