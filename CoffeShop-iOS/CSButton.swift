//
//  CSButton.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 05/06/21.
//

import UIKit

final class CSButtonFilled: UIButton {
    
    enum ButtonStyle { case filled; case outline }
    
    private var style: ButtonStyle!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(color:UIColor, title: String, style: ButtonStyle = .filled) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        self.style = style
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        layer.borderWidth = 2
        clipsToBounds = true
        setupStyle()
    }
    
    func setupStyle() {
        switch style {
        case .filled:
            backgroundColor = .primaryColor
            layer.borderColor = UIColor.primaryColor.cgColor
        case .outline:
            backgroundColor = .white
            setTitleColor(.primaryColor, for: .normal)

            // en modo oscuro el color del borde es igual al del background
            if self.traitCollection.userInterfaceStyle == .dark {
                layer.borderColor = UIColor.white.cgColor
            } else {
                layer.borderColor = UIColor.primaryColor.cgColor
            }
        case .none: break
        }
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        layer.cornerRadius = self.bounds.height / 2
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupStyle()
    }
    
}

extension UIColor {
    class var backgroundColor: UIColor {
        return   UIColor(named: "BackgroundColor") ?? .gray
    }
    
    class var primaryColor: UIColor {
        return   UIColor(named: "PrimaryColor") ?? .gray
    }
}
