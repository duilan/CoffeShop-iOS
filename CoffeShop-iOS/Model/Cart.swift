//
//  Cart.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 04/09/21.
//

struct Cart: Codable {
    let userID: String
    let cartProducts: [CartProduct]
}

struct CartProduct: Codable  {
    let product: Product
    let quantity: Int
    let total: Double
}
