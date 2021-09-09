//
//  CartModel.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 05/09/21.
//

import Firebase
import FirebaseFirestoreSwift

class CartModel {
    
    private let firestoreDB = Firestore.firestore()
    
    func add(cartProduct: CartProduct,userID: String) {
        
        let docReference = firestoreDB.collection("users").document(userID).collection("cart")
        let productID = cartProduct.product.id!
        do {
            if let idCartProduct = cartProduct.id {
                try docReference.document(idCartProduct).setData(from: cartProduct)
            } else {
                try docReference.document().setData(from: cartProduct)
            }
        } catch let error {
            print("Error writing cartProduct to Firestore: \(error)")
        }
    }
    
    func getCartProductsOf(userID: String, completion: @escaping ([CartProduct]) -> Void ) {
        
        let docReference = firestoreDB.collection("users").document(userID).collection("cart")
        
        docReference.addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else { return }
            
            let products = documents.compactMap { queryDocumentSnapshot -> CartProduct? in
                return try? queryDocumentSnapshot.data(as: CartProduct.self)
            }
            completion(products)
        }
    }
    
}
