//
//  ShopAnnotationView.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 02/08/21.
//

import UIKit
import MapKit

class ShopAnnotationView: MKAnnotationView {
    
    static let annotationID = "ShopAnnotationView"
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            image = UIImage(named: "shopPinSelected")
        } else {
            image = UIImage(named: "shopPinUnselected")
        }
    }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImage() {
        image = UIImage(named: "shopPinUnselected")
        if let imageHeight = image?.size.height {
            centerOffset = CGPoint(x: 0, y: -imageHeight / 2)
        }
    }
    
}
