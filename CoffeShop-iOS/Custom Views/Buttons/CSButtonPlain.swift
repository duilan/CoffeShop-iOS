//
//  CSButtonPlain.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 24/06/21.
//

import UIKit

final class CSButtonPlain: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(_ title: String, color: UIColor = CustomColors.primaryColor) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        adjustsImageWhenHighlighted = false
        clipsToBounds = true
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        backgroundColor = .white
        setTitle(title, for: .normal)
        setTitleColor(color, for: .normal)
        tintColor = color
        setBackgroundColor(color.withAlphaComponent(0.3), for: .highlighted)
    }
    
    func setIcon(name: String ) {
        setImage(UIImage(named: name), for: .normal)
        titleEdgeInsets.left = 20
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        layer.cornerRadius = (self.bounds.height * 0.8) / 2
        layer.cornerCurve = .continuous
    }
    
}
