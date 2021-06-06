//
//  CSButtonOutline.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 05/06/21.
//

import UIKit

final class CSButtonOutline: UIButton {
    
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
        setTitleColor(color, for: .normal)
        layer.borderColor = color.cgColor
        backgroundColor = .white
        clipsToBounds = true
        adjustsBorderInDarkmode()
    }
    
    private func adjustsBorderInDarkmode() {
        // en modo oscuro quitamos el borde
        if self.traitCollection.userInterfaceStyle == .dark {
            layer.borderWidth = 0
        } else {
            layer.borderWidth = 2
        }
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        layer.cornerRadius = self.bounds.height / 2
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        adjustsBorderInDarkmode()
    }
    
}
