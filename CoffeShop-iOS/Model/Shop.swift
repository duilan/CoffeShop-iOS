//
//  Shop.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 03/08/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Shop: Codable {
    @DocumentID var id: String?    
    let name: String
    let address: String
    let location: GeoPoint
}
