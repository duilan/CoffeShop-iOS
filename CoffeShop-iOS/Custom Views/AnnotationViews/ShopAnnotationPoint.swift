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
    var shopDetail: Shop!
    
    func configure(with shop: Shop) {
        identifier = shop.id
        title = shop.name
        shopDetail = shop        
        coordinate = CLLocationCoordinate2D(latitude: shop.location.latitude, longitude: shop.location.longitude)
    }
}
