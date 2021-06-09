//
//  CSTitleLabel.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 08/06/21.
//

import UIKit

final class CSTitleLabel: UILabel {
    
    // MARK: -  Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize: CGFloat, fontWeight: UIFont.Weight = .regular, textAlignment: NSTextAlignment = .left ) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        setup()
    }
    
    // MARK: -  Methods
    private func setup() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.8
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
