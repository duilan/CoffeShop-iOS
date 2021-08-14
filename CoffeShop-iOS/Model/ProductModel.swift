//
//  ProductModel.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 08/07/21.
//

import Firebase
import FirebaseFirestoreSwift

class ProductModel {
    
    private let firestoreDB = Firestore.firestore()
    private var products = [Product]()
    
    func getProducts( completion: @escaping ([Product]) -> Void) {
        
        var products = [Product]()
        firestoreDB.collection("products").addSnapshotListener { (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            products = documents.compactMap { queryDocumentSnapshot -> Product? in
                return try? queryDocumentSnapshot.data(as: Product.self)
            }
            
            self.products = products
            completion(products)
        }
    }
    
    private func createDataToFirebase() {
        #warning("cambiar esto a una clase para cargar distintos datos de prueba en firebase")
        let batch = firestoreDB.batch()
        
        productsTest.enumerated().forEach { (index,product) in
            do {
                let refNewDocument = firestoreDB.collection("products").document()
                try batch.setData(from: product, forDocument: refNewDocument)
            }
            catch let err { print("error setting data on batch \(err)") }
        }
        // commit
        batch.commit() { err in
            if let err = err {
                print("Error writing batch data on firebase \(err)")
            } else {
                print("Products write on firebase succeeded.")
            }
        }
    }
    
    let productsTest: [Product] = [
        Product(name: "Expresso Americano", price: 12.50, image: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FAmericano%403x.png?alt=media&token=417cc630-0a23-4ec7-ad6b-71c16b78c864", imageDetail: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/ProductDetail%2FAmericanoProductDetail.png?alt=media&token=6681f02e-d60d-4e1b-9444-894a7417eef9", description: "El café americano se prepara diluyendo un espresso con agua caliente", isAvailable: true, customizations: [
            Customization(type: "size", options: [
                Option(id: "small", desc: "small", price: 0),
                Option(id: "medium", desc: "medium", price: 5.50),
                Option(id: "large", desc: "large", price: 10.0)
            ], optionSelected: 0),
            Customization(type: "sugar", options: [
                Option(id: "nosugar", desc: "no sugar", price: 0),
                Option(id: "onesugarcube", desc: "1 cube ", price: 0),
                Option(id: "twosugarcube", desc: "2 cube ", price: 0),
                Option(id: "twosugarcube", desc: "3 cube ", price: 0)
            ], optionSelected: 1)
        ]),
        Product(name: "Cappuccino", price: 16.00, image: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FCappuccino%403x.png?alt=media&token=bdc17b04-466e-475f-816c-ef2684dfe354", imageDetail: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/ProductDetail%2FCappuccinoProductDetail.png?alt=media&token=34c78a55-a630-4ced-8430-d200773ef744", description: "El café espresso y la espuma de leche se combinan para crear el clásico cappuccino", isAvailable: true, customizations: [
            Customization(type: "size", options: [
                Option(id: "small", desc: "small", price: 0),
                Option(id: "medium", desc: "medium", price: 7.50),
                Option(id: "large", desc: "large", price: 12.00)
            ], optionSelected: 0),
            Customization(type: "sugar", options: [
                Option(id: "nosugar", desc: "no sugar", price: 0),
                Option(id: "onesugarcube", desc: "1 cube ", price: 0),
                Option(id: "twosugarcube", desc: "2 cube ", price: 0),
                Option(id: "twosugarcube", desc: "3 cube ", price: 0)
            ], optionSelected: 1)
        ]),
        Product(name: "Iced Latte", price: 18.00, image: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FIcedLatte%403x.png?alt=media&token=7bbb22d0-daed-4912-95d0-6687f4ed4e90", imageDetail: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/ProductDetail%2FIceLatteProductDetail.png?alt=media&token=be5915e5-c4af-468e-8f83-341f779829e4", description: "Espuma de leche, espresso, y estás listo para disfrutar de una refrescante café frío para cualquier momento del día.", isAvailable: true, customizations: [
            Customization(type: "size", options: [
                Option(id: "small", desc: "small", price: 0),
                Option(id: "medium", desc: "medium", price: 6.50),
                Option(id: "large", desc: "large", price: 10.00)
            ], optionSelected: 0),
            Customization(type: "sugar", options: [
                Option(id: "nosugar", desc: "no sugar", price: 0),
                Option(id: "onesugarcube", desc: "1 cube ", price: 0),
                Option(id: "twosugarcube", desc: "2 cube ", price: 0),
                Option(id: "twosugarcube", desc: "3 cube ", price: 0)
            ], optionSelected: 1)
        ]),
        Product(name: "Macchiato", price: 16.50, image: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FMacchiato%403x.png?alt=media&token=20234318-43be-4bfd-8467-47e74957e896", imageDetail: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/ProductDetail%2FMacchiatoProductDetail.png?alt=media&token=90e38b32-610d-4352-8c5d-dbe9843f1a88", description: "Un café de tueste suave pero lleno de sabor. Añade un poco de espuma de leche y obtendrás un delicioso y cremoso macchiato.", isAvailable: true, customizations: [
            Customization(type: "size", options: [
                Option(id: "small", desc: "small", price: 0),
                Option(id: "medium", desc: "medium", price: 5.50),
                Option(id: "large", desc: "large", price: 8.00)
            ], optionSelected: 0),
            Customization(type: "sugar", options: [
                Option(id: "nosugar", desc: "no sugar", price: 0),
                Option(id: "onesugarcube", desc: "1 cube ", price: 0),
                Option(id: "twosugarcube", desc: "2 cube ", price: 0),
                Option(id: "twosugarcube", desc: "3 cube ", price: 0)
            ], optionSelected: 1)
        ]),
        Product(name: "Mocha", price: 25.00, image: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FMocha%403x.png?alt=media&token=4131c72c-3906-483c-84ab-8355ac309be0", imageDetail: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/ProductDetail%2FMochaProductDetail.png?alt=media&token=d3d89393-b089-41a7-908f-895a386db968", description: "Un poco de crema batida y una pizca de virutas de chocolate lo son todo para este rico clásico achocolatado.", isAvailable: true, customizations: [
            Customization(type: "size", options: [
                Option(id: "small", desc: "small", price: 0),
                Option(id: "medium", desc: "medium", price: 8.00),
                Option(id: "large", desc: "large", price: 14.50)
            ], optionSelected: 0),
            Customization(type: "sugar", options: [
                Option(id: "nosugar", desc: "no sugar", price: 0),
                Option(id: "onesugarcube", desc: "1 cube ", price: 0),
                Option(id: "twosugarcube", desc: "2 cube ", price: 0),
                Option(id: "twosugarcube", desc: "3 cube ", price: 0)
            ], optionSelected: 1),
            Customization(type: "Whipped cream", options: [
                Option(id: "nowhippedcream", desc: "no whippedcream", price: 0),
                Option(id: "whippedcream", desc: "whipped cream ", price: 0)
            ], optionSelected: 1)
        ])
    ]
}
