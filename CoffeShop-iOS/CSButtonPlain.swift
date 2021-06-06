//
//  CSButtonPlain.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 06/06/21.
//

import UIKit

final class CSButtonPlain: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String, color: UIColor = CustomColors.primaryColor) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        setTitle(title, for: .normal)
        backgroundColor = color
        clipsToBounds = true
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        layer.cornerRadius = self.bounds.height / 2
    }
    
}
