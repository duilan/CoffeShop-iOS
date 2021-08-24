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
        
        firestoreDB.collection("products").addSnapshotListener { (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            let productsResult = documents.compactMap { queryDocumentSnapshot -> Product? in
                return try? queryDocumentSnapshot.data(as: Product.self)
            }
            
            self.products = productsResult
            completion(productsResult)
        }
    }
    
    func getProductsMenu(of shop: Shop , completion: @escaping ([Product]) -> Void) {
        
        firestoreDB.collection("products").whereField(FieldPath.documentID(), in: shop.menu).getDocuments { (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            let productsResult = documents.compactMap { queryDocumentSnapshot -> Product? in
                return try? queryDocumentSnapshot.data(as: Product.self)
            }
            
            self.products = productsResult
            completion(productsResult)
        }
    }
    
}
