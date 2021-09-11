//
//  UIViewController+Ext.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 24/06/21.
//

import UIKit

fileprivate var containerLoadingView: UIView!

extension UIViewController {
    func presetCSAlertVC(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alert = CSAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            self.present(alert, animated: true)
        }
    }
    
    func showLoadingView() {
        if containerLoadingView == nil {
            containerLoadingView = UIView(frame: self.view.bounds)
            view.addSubview(containerLoadingView)
            
            containerLoadingView.backgroundColor = CustomColors.backgroundColor
            containerLoadingView.alpha = 0
            
            UIView.animate(withDuration: 0.25) {
                containerLoadingView.alpha = 0.8
            }
            
            let activityIndicator = UIActivityIndicatorView(style: .large)
            containerLoadingView.addSubview(activityIndicator)
            
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
            activityIndicator.startAnimating()
        }
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            if containerLoadingView != nil {                
                containerLoadingView.removeFromSuperview()
                containerLoadingView = nil
            }
        }
    }
}
