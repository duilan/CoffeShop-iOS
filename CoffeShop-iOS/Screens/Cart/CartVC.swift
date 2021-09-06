//
//  CartVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 05/09/21.
//

import UIKit

class CartVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = CustomColors.backgroundColor
        title = "My Order"
    }
    
}
