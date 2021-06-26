//
//  ShopsVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 25/06/21.
//

import UIKit

class ShopsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        title = "Shops"
        view.backgroundColor = CustomColors.backgroundColor
        self.navigationItem.backButtonTitle = ""
    }
    
    #warning("THIS IS TEMPORAL just simulate a jump to ProductListVC of a store in map")
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.pushViewController(ProductListVC(), animated: true)
    }
    
}
