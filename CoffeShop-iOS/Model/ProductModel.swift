//
//  ProductModel.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 08/07/21.
//

import Firebase
import FirebaseFirestoreSwift

class ProductModel {
    
    private let firestoreDB = Firestore.firestore()
    private var products = [Product]()
    
    func getProducts( completion: @escaping ([Product]) -> Void) {
        
        var products = [Product]()
        firestoreDB.collection("products").addSnapshotListener { (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            products = documents.compactMap { queryDocumentSnapshot -> Product? in
                return try? queryDocumentSnapshot.data(as: Product.self)
            }
            
            self.products = products
            completion(products)
        }
    }
}
