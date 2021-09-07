//
//  Cart.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 04/09/21.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct Cart: Codable {
    let userID: String
    let cartProducts: [CartProduct]
}

struct CartProduct: Codable, Identifiable, Hashable  {
    @DocumentID var id: String?
    let product: Product
    let quantity: Int
    let total: Double
    
    static func == (lhs: CartProduct, rhs: CartProduct) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
