//
//  CartTotalTableFooterView.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 25/09/21.
//

import UIKit

class CartTotalTableFooterView: UIView {
    
    let titleSubTotalLabel = CSTitleLabel(fontSize: 14, fontWeight: .semibold, textAlignment: .left)
    let subtotalLabel = CSTitleLabel(fontSize: 14, fontWeight: .semibold, textAlignment: .right)
    
    let titleIVALabel = CSTitleLabel(fontSize: 14, fontWeight: .semibold, textAlignment: .left)
    let IVALabel = CSTitleLabel(fontSize: 14, fontWeight: .semibold, textAlignment: .right)
    
    let titleTotalLabel = CSTitleLabel(fontSize: 26, fontWeight: .black, textAlignment: .left)
    let totalLabel = CSTitleLabel(fontSize: 18, fontWeight: .black, textAlignment: .right)
    
    let IVAPorcent = 0.16
    
    func configure(with subtotal: Double = 0.0) {        
        subtotalLabel.text = String(format: "$ %.02f", subtotal)
        let iva = subtotal * IVAPorcent
        IVALabel.text = String(format: "$ %.02f", iva)
        let total = subtotal + iva
        totalLabel.text = String(format: "$ %.02f", total)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        addSubview(titleSubTotalLabel)
        addSubview(subtotalLabel)
        titleSubTotalLabel.text = "Subtotal"
        subtotalLabel.text = "$ 0.00"
        titleSubTotalLabel.textColor = CustomColors.textPrimaryColor
        subtotalLabel.textColor = CustomColors.textPrimaryColor
        
        addSubview(titleIVALabel)
        addSubview(IVALabel)
        titleIVALabel.text = "IVA (16%)"
        IVALabel.text = "$ 0.00"
        titleIVALabel.textColor = CustomColors.textPrimaryColor
        IVALabel.textColor = CustomColors.textPrimaryColor
        
        addSubview(titleTotalLabel)
        addSubview(totalLabel)
        titleTotalLabel.text = "Total"
        totalLabel.text = "$ 0.00"
        titleTotalLabel.textColor = CustomColors.textPrimaryColor
        totalLabel.textColor = CustomColors.textPrimaryColor
        
        titleSubTotalLabel.anchor(top: topAnchor, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 0, paddingLeft: 30, paddingRight: 0, paddingBottom: 0, width: 100, height: 25)
        subtotalLabel.anchor(top: topAnchor, left: nil, right: trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 30, paddingBottom: 0, width: 100, height: 25)
        
        titleIVALabel.anchor(top: titleSubTotalLabel.bottomAnchor, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 0, paddingLeft: 30, paddingRight: 0, paddingBottom: 0, width: 100, height: 25)
        IVALabel.anchor(top: subtotalLabel.bottomAnchor, left: nil, right: trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 30, paddingBottom: 0, width: 100, height: 25)        
        
        titleTotalLabel.anchor(top: titleIVALabel.bottomAnchor, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 5, paddingLeft: 30, paddingRight: 0, paddingBottom: 0, width: 100, height: 30)
        totalLabel.anchor(top: IVALabel.bottomAnchor, left: nil, right: trailingAnchor, bottom: nil, paddingTop: 5, paddingLeft: 0, paddingRight: 30, paddingBottom: 0, width: 100, height: 30)
    }
    
}
