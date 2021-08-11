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
        let latitude: CLLocationDegrees = shop.location.latitude
        let longitude: CLLocationDegrees = shop.location.longitude
        print(latitude,longitude)
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
