//
//  FirebaseDataSeeder.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 14/08/21.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

enum CollectionReferenceForFirebase: String {
    case products
    case shops
    case menus
}

class FirebaseDataSeeder {
    
    static let shared = FirebaseDataSeeder()
    private let db = Firestore.firestore()
    
    private init() {}
    
    func run() {
        seed(data: DataSeeds.productsData, inCollection: .products, prefixIndex: "product")
        seed(data: DataSeeds.shopsData, inCollection: .shops, prefixIndex: "shop")
    }
    
    private func seed<T: Codable>( data: [T], inCollection collection: CollectionReferenceForFirebase, prefixIndex: String? = nil ) {
        
        let batch = db.batch()
        // setting each data document in batch
        data.enumerated().forEach { (index,product) in
            
            let referenceNewDocument: DocumentReference
            //
            if let prefixIndex = prefixIndex {
                let  DocumentID = "\(prefixIndex)-\(index)"
                referenceNewDocument = db.collection(collection.rawValue).document(DocumentID)
            } else {
                referenceNewDocument = db.collection(collection.rawValue).document()
            }
            
            do {
                try batch.setData(from: product, forDocument: referenceNewDocument)
            }
            catch let err {
                print("error setting data on batch in FirebaseDataSeeder \(err)")
            }
        }
        // Commit batch data
        batch.commit() { err in
            if let err = err {
                print("Error writing batch \(collection) dataseeds on firebase \(err)")
            } else {
                print("\(collection) write on firebase succeeded.")
            }
        }
    }
}
