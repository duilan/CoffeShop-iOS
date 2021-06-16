//
//  RegisterVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 15/06/21.
//

import UIKit

class RegisterVC: UIViewController {
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: -  Private Methods
    func setup() {
        title = "Register"
        view.backgroundColor = CustomColors.backgroundColor
    }
    
}
