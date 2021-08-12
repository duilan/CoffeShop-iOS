//
//  ShopModel.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 03/08/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class ShopModel {
    
    private let firestoreDB = Firestore.firestore()
    private var coffeShops = [Shop]()
    
    func getShops( completion: @escaping ([Shop]) -> Void) {
        var shops = [Shop]()
        firestoreDB.collection("shops").addSnapshotListener { [weak self] (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            shops = documents.compactMap { queryDocumentSnapshot -> Shop? in
                return try? queryDocumentSnapshot.data(as: Shop.self)
            }
            self?.coffeShops = shops
            completion(shops)
        }
    }
    
    
    func getShopBy(id: String) -> Shop? {
        let shop = coffeShops.first(where: {$0.id == id})
        return shop
    }
}
