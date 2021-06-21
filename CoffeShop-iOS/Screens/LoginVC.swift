//
//  LoginVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 21/06/21.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: -  Private Methods
    private func setup() {
        title = "Login"
        view.backgroundColor = CustomColors.backgroundColor
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
