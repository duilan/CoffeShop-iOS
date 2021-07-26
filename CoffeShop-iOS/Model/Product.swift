//
//  Product.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 25/06/21.
//

struct Product {
    let name: String
    let price: Float
    let image_url: String
    let image_detail_url: String
    let description: String    
    let isAvailable: Bool
    var posibleCustomizations: ProductCustomizations
}

extension Product: Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price
    }
    
    func priceFormatted() -> String {
        return String(format: "$%.02f", price)
    }
}

