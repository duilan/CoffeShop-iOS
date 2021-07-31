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
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.transform = CGAffineTransform.identity
            }
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
    
}
