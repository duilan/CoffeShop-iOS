//
//  CartModel.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 05/09/21.
//

import Firebase

class CartModel {
    
    private let firestoreDB = Firestore.firestore()
    
    func add(cartProduct: CartProduct,userID: String) {
        
        let docReference = firestoreDB.collection("users").document(userID).collection("cart")
        let productID = cartProduct.product.id!
        do {
            try docReference.document(productID).setData(from: cartProduct)
        } catch let error {
            print("Error writing city to Firestore: \(error)")
        }
    }        
    
}
