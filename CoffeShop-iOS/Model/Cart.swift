//
//  Cart.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 04/09/21.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct CartProduct: Codable, Identifiable, Hashable  {
    @DocumentID var id: String?
    let product: Product
    let quantity: Int
    let total: Double
    var customizationsOptions: [Option]
    
    static func == (lhs: CartProduct, rhs: CartProduct) -> Bool {
        lhs.id == rhs.id &&
        lhs.quantity == rhs.quantity &&
        lhs.total == rhs.total &&
        lhs.customizationsOptions == rhs.customizationsOptions
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func totalFormatted() -> String {
        return String(format: "$%.02f", total)
    }
}
