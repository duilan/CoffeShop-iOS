//
//  OnboardingVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 05/06/21.
//

import UIKit

class OnboardingVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupLayout()
    }
    
    func setup() {
        view.backgroundColor =  CustomColors.backgroundColor
        navigationController?.isNavigationBarHidden = true
    }
    
    func setupLayout() {}
    
}
