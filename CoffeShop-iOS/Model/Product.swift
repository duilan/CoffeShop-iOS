//
//  Product.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 25/06/21.
//

struct Product {
    let name: String
    let price: Float
    let image_url: String
    let image_detail_url: String
    let description: String    
    let isAvailable: Bool
    var posibleCustomizations: ProductCustomizations
}

struct ProductCustomizations {
    var customizations: [Customization]
    
    func getOptionsSelected () -> [CustomizationOption]{
        var selections = [CustomizationOption]()
        for customization in self.customizations {
            if let optionSelected = customization.optionSelected {
                selections.append(customization.options[optionSelected])
            }
        }
        return selections
    }
}

struct Customization {
    let type: CustomizationType
    let options: [CustomizationOption]
    var optionSelected: Int?
}

struct CustomizationOption {
    let id: String
    let desc: String
    let price: Float
}

enum CustomizationType: String {
    case size = "Size"
    case sugar = "Sugar"
    case cream = "Whipped cream"
}

