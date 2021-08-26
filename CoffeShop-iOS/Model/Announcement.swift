//
//  Announcement.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 23/08/21.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct Announcement: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    let title: String
    let body: String
    let imageURL: String
    let category: String
    let createAt: Timestamp    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct SectionAnnouncement: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    let title: String
    let type: String
    let announcements: [Announcement]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
