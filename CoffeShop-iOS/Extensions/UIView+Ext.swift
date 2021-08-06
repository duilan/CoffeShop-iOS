//
//  UIView+Ext.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 09/06/21.
//

import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingRight: CGFloat, paddingBottom: CGFloat, width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        // top constraint & paddingTop
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        // left constraint & paddingLeft
        if let left = left {
            self.leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        // right constraint & paddingRight
        if let right = right {
            self.trailingAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        // bottom constraint & paddingBottom
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        // width constraint
        if width != 0 {            
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        // height constraint
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    // MARK: -  Animations    
    func pulseAnimation() {
        self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        })
    }
    
    func popInCenterAnimation() {
        transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        layer.opacity = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.layer.opacity = 1
            self.transform = CGAffineTransform.identity
        })
    }
    
    func slideInBottomAnimation() {
        self.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
        self.layer.opacity = 1
        UIView.animate(withDuration: 0.4, animations: {
            self.transform = .identity
        })
    }
    
    func slideOutBottomAnimation() {
        UIView.animate(withDuration: 0.4, animations: {
            self.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
            self.layer.opacity = 0
        }) { _ in
            self.transform = .identity
        }
    }
    
}
