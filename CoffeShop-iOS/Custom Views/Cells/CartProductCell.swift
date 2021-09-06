//
//  CartProductCell.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 05/09/21.
//

import UIKit

class CartProductCell: UITableViewCell {
    static let cellID = "CartProductCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
