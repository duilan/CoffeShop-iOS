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
        simulateStoreTappedInmap()
    }
    
    private func setup() {
        title = "Shops"
        view.backgroundColor = CustomColors.backgroundColor
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func simulateStoreTappedInmap() {
        #warning("THIS IS TEMPORAL just simulate a jump to ProductListVC of a store in map")
        let btn = CSButtonFilled("Store Tapped!")
        view.addSubview(btn)
        btn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        btn.addTarget(self, action: #selector(goToProductList), for: .touchUpInside)
    }
    
    @objc private func goToProductList() {
        #warning("THIS IS TEMPORAL just simulate a jump to ProductListVC of a store in map")
        navigationController?.pushViewController(ProductListVC(), animated: true)
    }
    
}
