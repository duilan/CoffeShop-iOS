//
//  UIViewController+Ext.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 24/06/21.
//

import UIKit

extension UIViewController {
    func presetCSAlertVC(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alert = CSAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            self.present(alert, animated: true)
        }
    }
}
