//
//  ProductDataSeed.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 14/08/21.
//

import FirebaseFirestore

struct DataSeeds {
    
    static let shopsData: [Shop] = [
        Shop(id: "CS1", name: "Santo Tomás", address: "Calle Santo Tomás, Cuauhtémoc, 06060 Ciudad de México, México", location: GeoPoint(latitude: 19.427271821196612, longitude: -99.12627266528202), menu: ["Expresso_Americano","Cappuccino","Iced_Latte","Macchiato","Mocha"]),
        Shop(id: "CS2", name: "Viaducto 1", address: "Viaducto Presidente Miguel Alemán, Piedad Narvarte, 03000 Ciudad de México, México", location: GeoPoint(latitude: 19.4038828686858, longitude: -99.15681399541693), menu: ["Expresso_Americano","Cappuccino","Iced_Latte","Macchiato","Mocha"] ),
        Shop(id: "CS3", name: "Areonáutica", address: "Calle Sur 109, Aeronáutica militar, 15970 Ciudad de México, México", location: GeoPoint(latitude: 19.42111096383475, longitude: -99.11528777258876), menu: ["Expresso_Americano","Cappuccino","Iced_Latte","Macchiato","Mocha"]),
        Shop(id: "CS4", name: "El parque", address: "Jardin Balbuena, Avenida Fray Servando Teresa de Mier, Del Parque, 15970 Ciudad de México, México", location: GeoPoint(latitude: 19.422118174089448, longitude: -99.1206713727411), menu: ["Expresso_Americano","Cappuccino","Iced_Latte","Macchiato","Mocha"])
    ]
    
    static let productsData: [Product] = [
        Product(id: "Expresso_Americano", name: "Expresso Americano", price: 12.50, image: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FAmericano%403x.png?alt=media&token=417cc630-0a23-4ec7-ad6b-71c16b78c864", imageDetail: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/ProductDetail%2FAmericanoProductDetail.png?alt=media&token=6681f02e-d60d-4e1b-9444-894a7417eef9", description: "El café americano se prepara diluyendo un espresso con agua caliente", isAvailable: true, customizations: [
            Customization(type: "size", options: [
                Option(id: "small", desc: "small", price: 0),
                Option(id: "medium", desc: "medium", price: 5.50),
                Option(id: "large", desc: "large", price: 10.0)
            ], optionSelected: 0),
            Customization(type: "sugar", options: [
                Option(id: "nosugar", desc: "no sugar", price: 0),
                Option(id: "onesugarcube", desc: "1 cube ", price: 0),
                Option(id: "twosugarcube", desc: "2 cube ", price: 0),
                Option(id: "threesugarcube", desc: "3 cube ", price: 0)
            ], optionSelected: 1)
        ]),
        Product(id:"Cappuccino", name: "Cappuccino", price: 16.00, image: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FCappuccino%403x.png?alt=media&token=bdc17b04-466e-475f-816c-ef2684dfe354", imageDetail: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/ProductDetail%2FCappuccinoProductDetail.png?alt=media&token=34c78a55-a630-4ced-8430-d200773ef744", description: "El café espresso y la espuma de leche se combinan para crear el clásico cappuccino", isAvailable: true, customizations: [
            Customization(type: "size", options: [
                Option(id: "small", desc: "small", price: 0),
                Option(id: "medium", desc: "medium", price: 7.50),
                Option(id: "large", desc: "large", price: 12.00)
            ], optionSelected: 0),
            Customization(type: "sugar", options: [
                Option(id: "nosugar", desc: "no sugar", price: 0),
                Option(id: "onesugarcube", desc: "1 cube ", price: 0),
                Option(id: "twosugarcube", desc: "2 cube ", price: 0),
                Option(id: "threesugarcube", desc: "3 cube ", price: 0)
            ], optionSelected: 1)
        ]),
        Product(id:"Iced_Latte", name: "Iced Latte", price: 18.00, image: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FIcedLatte%403x.png?alt=media&token=7bbb22d0-daed-4912-95d0-6687f4ed4e90", imageDetail: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/ProductDetail%2FIceLatteProductDetail.png?alt=media&token=be5915e5-c4af-468e-8f83-341f779829e4", description: "Espuma de leche, espresso, y estás listo para disfrutar de una refrescante café frío para cualquier momento del día.", isAvailable: true, customizations: [
            Customization(type: "size", options: [
                Option(id: "small", desc: "small", price: 0),
                Option(id: "medium", desc: "medium", price: 6.50),
                Option(id: "large", desc: "large", price: 10.00)
            ], optionSelected: 0),
            Customization(type: "sugar", options: [
                Option(id: "nosugar", desc: "no sugar", price: 0),
                Option(id: "onesugarcube", desc: "1 cube ", price: 0),
                Option(id: "twosugarcube", desc: "2 cube ", price: 0),
                Option(id: "threesugarcube", desc: "3 cube ", price: 0)
            ], optionSelected: 1)
        ]),
        Product(id:"Macchiato", name: "Macchiato", price: 16.50, image: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FMacchiato%403x.png?alt=media&token=20234318-43be-4bfd-8467-47e74957e896", imageDetail: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/ProductDetail%2FMacchiatoProductDetail.png?alt=media&token=90e38b32-610d-4352-8c5d-dbe9843f1a88", description: "Un café de tueste suave pero lleno de sabor. Añade un poco de espuma de leche y obtendrás un delicioso y cremoso macchiato.", isAvailable: true, customizations: [
            Customization(type: "size", options: [
                Option(id: "small", desc: "small", price: 0),
                Option(id: "medium", desc: "medium", price: 5.50),
                Option(id: "large", desc: "large", price: 8.00)
            ], optionSelected: 0),
            Customization(type: "sugar", options: [
                Option(id: "nosugar", desc: "no sugar", price: 0),
                Option(id: "onesugarcube", desc: "1 cube ", price: 0),
                Option(id: "twosugarcube", desc: "2 cube ", price: 0),
                Option(id: "threesugarcube", desc: "3 cube ", price: 0)
            ], optionSelected: 1)
        ]),
        Product(id:"Mocha", name: "Mocha", price: 25.00, image: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FMocha%403x.png?alt=media&token=4131c72c-3906-483c-84ab-8355ac309be0", imageDetail: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/ProductDetail%2FMochaProductDetail.png?alt=media&token=d3d89393-b089-41a7-908f-895a386db968", description: "Un poco de crema batida y una pizca de virutas de chocolate lo son todo para este rico clásico achocolatado.", isAvailable: true, customizations: [
            Customization(type: "size", options: [
                Option(id: "small", desc: "small", price: 0),
                Option(id: "medium", desc: "medium", price: 8.00),
                Option(id: "large", desc: "large", price: 14.50)
            ], optionSelected: 0),
            Customization(type: "sugar", options: [
                Option(id: "nosugar", desc: "no sugar", price: 0),
                Option(id: "onesugarcube", desc: "1 cube ", price: 0),
                Option(id: "twosugarcube", desc: "2 cube ", price: 0),
                Option(id: "threesugarcube", desc: "3 cube ", price: 0)
            ], optionSelected: 1),
            Customization(type: "Whipped cream", options: [
                Option(id: "nowhippedcream", desc: "no whippedcream", price: 0),
                Option(id: "whippedcream", desc: "whipped cream ", price: 0)
            ], optionSelected: 1)
        ])
    ]
    
    static let announcementsData: [Announcement] = [
        Announcement( id: "AD1", title: "Titulo del anuncio", body: "cuerpo del anuncio", imageURL: "http://", category: "announcement", createAt: Timestamp()),
        Announcement( id: "AD2", title: "Titulo del anuncio", body: "cuerpo del anuncio", imageURL: "http://", category: "announcement", createAt: Timestamp()),
        Announcement( id: "N1", title: "Titulo de noticia", body: "cuerpo de noticia", imageURL: "http://", category: "newsletter", createAt: Timestamp()),
        Announcement( id: "N2", title: "Titulo de noticia", body: "cuerpo de noticia", imageURL: "http://", category: "newsletter", createAt: Timestamp()),
        Announcement( id: "N3", title: "Titulo de noticia", body: "cuerpo de noticia", imageURL: "http://", category: "newsletter", createAt: Timestamp()),
        Announcement( id: "N4", title: "Titulo de noticia", body: "cuerpo de noticia", imageURL: "http://", category: "newsletter", createAt: Timestamp()),
        Announcement( id: "P1", title: "Titulo de promocion", body: "cuerpo de promocion", imageURL: "http://", category: "promotion", createAt: Timestamp()),
        Announcement( id: "P2", title: "Titulo de promocion", body: "cuerpo de promocion", imageURL: "http://", category: "promotion", createAt: Timestamp()),
        Announcement( id: "P3", title: "Titulo de promocion", body: "cuerpo de promocion", imageURL: "http://", category: "promotion", createAt: Timestamp()),
        Announcement( id: "P4", title: "Titulo de promocion", body: "cuerpo de promocion", imageURL: "http://", category: "promotion", createAt: Timestamp()),
        
    ]
}
