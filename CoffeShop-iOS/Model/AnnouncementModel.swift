//
//  AnnouncementModel.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 23/08/21.
//

import FirebaseFirestore

class AnnouncementModel {
    
    private let firestoreDB = Firestore.firestore()
    var announcements = [Announcement]()
    
    func getAnnouncements( completion: @escaping ([Announcement]) -> Void ) {
        // peticion a firebase
        firestoreDB.collection("announcements").getDocuments { (querySnapshot, err) in
            // verificamos que existan documentos en la collection
            guard let documents = querySnapshot?.documents else { return }
            //trasformamos los documentos a obj
            let announcementsResult = documents.compactMap { queryDocumentSnapshot -> Announcement? in
                return try? queryDocumentSnapshot.data(as: Announcement.self)
            }
            self.announcements = announcementsResult
            completion(announcementsResult)
        }
    }
    
}
