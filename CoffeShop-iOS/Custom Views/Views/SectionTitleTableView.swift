//
//  SectionTitleTableView.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 19/07/21.
//

import UIKit

class SectionTitleTableView: UIView {
    private let titleBadge = CSBadgeView()
    private let separatorView = UIView(frame: .zero)
    
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
        setupSeparator()
        setupTitleBadge()
    }
    
    private func setupTitleBadge() {
        addSubview(titleBadge)
        titleBadge.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleBadge.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleBadge.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        titleBadge.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupSeparator(){
        addSubview(separatorView)
        separatorView.layer.cornerRadius = 6
        separatorView.backgroundColor = CustomColors.backgroundColorTertiary
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-20).isActive = true
        separatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
