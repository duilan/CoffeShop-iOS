//
//  AnnouncementModel.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 23/08/21.
//

import FirebaseFirestore

class AnnouncementModel {
    
    private let firestoreDB = Firestore.firestore()
    var announcements = [SectionAnnouncement]()
    
    func getAllSectionAnnouncements( completion: @escaping ([SectionAnnouncement]) -> Void ) {
        // peticion a firebase
        firestoreDB.collection("sectionAnnouncements").getDocuments { (querySnapshot, err) in
            // verificamos que existan documentos en la collection
            guard let documents = querySnapshot?.documents else { return }
            //trasformamos los documentos a obj
            let announcementsResult = documents.compactMap { queryDocumentSnapshot -> SectionAnnouncement? in
                return try? queryDocumentSnapshot.data(as: SectionAnnouncement.self)
            }
            self.announcements = announcementsResult
            completion(announcementsResult)
        }
    }
    
}
