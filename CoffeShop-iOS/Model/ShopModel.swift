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
    private var listenerShops: ListenerRegistration!
    
    func getShops( completion: @escaping ([Shop]) -> Void) {
        listenerShops = firestoreDB.collection("shops").addSnapshotListener { [weak self] (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            let shopsResult = documents.compactMap { queryDocumentSnapshot -> Shop? in
                return try? queryDocumentSnapshot.data(as: Shop.self)
            }
            self?.coffeShops = shopsResult
            completion(shopsResult)
        }
    }
    
    
    func getShopBy(id: String) -> Shop? {
        let shop = coffeShops.first(where: {$0.id == id})
        return shop
    }
    
    private func removeListeners() {
        if listenerShops != nil {
            listenerShops.remove()
        }
    }
    
    deinit {
        removeListeners()
    }
}
