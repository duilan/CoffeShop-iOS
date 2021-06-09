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
            print(width)
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        // height constraint
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

