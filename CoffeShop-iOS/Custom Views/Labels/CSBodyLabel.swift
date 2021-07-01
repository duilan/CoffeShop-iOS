//
//  CSBodyLabel.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 01/07/21.
//

import UIKit

class CSBodyLabel: UILabel {

    // MARK: -  Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize: CGFloat = 14, fontWeight: UIFont.Weight = .regular, textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        setup()
    }
    
    // MARK: -  Methods
    private func setup() {
        textColor = .secondaryLabel
        numberOfLines = 0
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
