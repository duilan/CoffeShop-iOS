//
//  Product.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 25/06/21.
//

import FirebaseFirestoreSwift

struct Product: Codable {
    @DocumentID var id: String?
    let name: String
    let price: Double
    let image, imageDetail, description: String
    let isAvailable: Bool
    var customizations: [Customization]
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price
    }
    
    func priceFormatted() -> String {
        return String(format: "$%.02f", price)
    }
    
    func getCustomizationsOptionsSelected () -> [Option]{
        var selections = [Option]()
        for customization in self.customizations {
            let optionSelected = customization.optionSelected
            selections.append(customization.options[optionSelected])
        }
        return selections
    }
    
}

// MARK: - Customization
struct Customization: Codable {
    let type: String
    let options: [Option]
    var optionSelected: Int
}

// MARK: - Option
struct Option: Codable {
    let id, desc: String
    let price: Double
    
    func priceFormatted() -> String {
        return String(format: "+ $%.02f", price)
    }
}
