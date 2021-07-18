//
//  HomeVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 23/06/21.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = CustomColors.backgroundColor
    }
    
}
