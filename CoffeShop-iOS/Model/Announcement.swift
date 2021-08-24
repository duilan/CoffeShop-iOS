//
//  Announcement.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 23/08/21.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct Announcement: Codable, Identifiable {
    @DocumentID var id: String?
    let title: String
    let body: String
    let imageURL: String
    let category: String
    let createAt: Timestamp
}
