//
//  ShopAnnotationPoint.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 05/08/21.
//

import UIKit
import MapKit

class ShopAnnotationPoint : MKPointAnnotation {
    
    var identifier: String!
        
    func configure(with shop: Shop) {
        identifier = shop.id
        title = shop.name
        coordinate = CLLocationCoordinate2D(latitude: shop.latitude, longitude: shop.longitude)
    }
}
