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
    case announcements
}

class FirebaseDataSeeder {
    
    static let shared = FirebaseDataSeeder()
    private let db = Firestore.firestore()
    
    private init() {}
    
    func run() {
        seed(data: DataSeeds.productsData, inCollection: .products)
        seed(data: DataSeeds.shopsData, inCollection: .shops)
        seed(data: DataSeeds.announcementsData, inCollection: .announcements)
    }
    
    private func seed<T: Codable & Identifiable >( data: [T], inCollection collection: CollectionReferenceForFirebase, prefixIndex: String? = nil ) {
        
        let batch = db.batch()
        // setting each data document in batch
        data.enumerated().forEach { (index,item) in
            
            let referenceNewDocument: DocumentReference
            
            //check if item has an ID to use it as documentID, otherwise it autogen
            if let ids = item.id as? String  {
                let docID = "\(prefixIndex ?? "")\(ids)"
                referenceNewDocument = db.collection(collection.rawValue).document(docID)
            } else {
                referenceNewDocument = db.collection(collection.rawValue).document()
            }
            
            do {
                try batch.setData(from: item, forDocument: referenceNewDocument)
            } catch {
                print("error setting data on batch in FirebaseDataSeeder \(error)")
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
