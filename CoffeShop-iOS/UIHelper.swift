//
//  UIHelper.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 11/06/21.
//

import UIKit

struct  UIHelper {
    static func createOneColumnFlowLayout(in view: UIView, padding: CGFloat) -> UICollectionViewFlowLayout {
        let viewWidth = view.bounds.width
        let viewHeight = view.bounds.height
        let itemWidth = viewWidth - (padding * 2)
        let itemHeight = viewHeight // full height (without padding top,bottom)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
        flowLayout.minimumLineSpacing = padding * 2
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        flowLayout.scrollDirection = .horizontal
        
        return flowLayout
    }
}
