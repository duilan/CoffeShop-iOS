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
            Customization(type: "Size", options: [
                Option(id: "small", desc: "Small", price: 0),
                Option(id: "medium", desc: "Medium", price: 5.50),
                Option(id: "large", desc: "Large", price: 10.0)
            ], optionSelected: 0),
            Customization(type: "Sugar", options: [
                Option(id: "nosugar", desc: "No", price: 0),
                Option(id: "onesugarcube", desc: "1 Packet", price: 0),
                Option(id: "twosugarcube", desc: "2 Packets", price: 0),
                Option(id: "threesugarcube", desc: "3 Packets", price: 0)
            ], optionSelected: 1)
        ]),
        Product(id:"Cappuccino", name: "Cappuccino", price: 16.00, image: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FCappuccino%403x.png?alt=media&token=bdc17b04-466e-475f-816c-ef2684dfe354", imageDetail: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/ProductDetail%2FCappuccinoProductDetail.png?alt=media&token=34c78a55-a630-4ced-8430-d200773ef744", description: "El café espresso y la espuma de leche se combinan para crear el clásico cappuccino", isAvailable: true, customizations: [
            Customization(type: "Size", options: [
                Option(id: "small", desc: "Small", price: 0),
                Option(id: "medium", desc: "Medium", price: 7.50),
                Option(id: "large", desc: "Large", price: 12.00)
            ], optionSelected: 0),
            Customization(type: "Sugar", options: [
                Option(id: "nosugar", desc: "No", price: 0),
                Option(id: "onesugarcube", desc: "1 Packet", price: 0),
                Option(id: "twosugarcube", desc: "2 Packets", price: 0),
                Option(id: "threesugarcube", desc: "3 Packets", price: 0)
            ], optionSelected: 1)
        ]),
        Product(id:"Iced_Latte", name: "Iced Latte", price: 18.00, image: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FIcedLatte%403x.png?alt=media&token=7bbb22d0-daed-4912-95d0-6687f4ed4e90", imageDetail: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/ProductDetail%2FIceLatteProductDetail.png?alt=media&token=be5915e5-c4af-468e-8f83-341f779829e4", description: "Espuma de leche, espresso, y estás listo para disfrutar de una refrescante café frío para cualquier momento del día.", isAvailable: true, customizations: [
            Customization(type: "Size", options: [
                Option(id: "small", desc: "Small", price: 0),
                Option(id: "medium", desc: "Medium", price: 6.50),
                Option(id: "large", desc: "Large", price: 10.00)
            ], optionSelected: 0),
            Customization(type: "Sugar", options: [
                Option(id: "nosugar", desc: "No", price: 0),
                Option(id: "onesugarcube", desc: "1 Packet", price: 0),
                Option(id: "twosugarcube", desc: "2 Packets", price: 0),
                Option(id: "threesugarcube", desc: "3 Packets", price: 0)
            ], optionSelected: 1)
        ]),
        Product(id:"Macchiato", name: "Macchiato", price: 16.50, image: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FMacchiato%403x.png?alt=media&token=20234318-43be-4bfd-8467-47e74957e896", imageDetail: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/ProductDetail%2FMacchiatoProductDetail.png?alt=media&token=90e38b32-610d-4352-8c5d-dbe9843f1a88", description: "Un café de tueste suave pero lleno de sabor. Añade un poco de espuma de leche y obtendrás un delicioso y cremoso macchiato.", isAvailable: true, customizations: [
            Customization(type: "Size", options: [
                Option(id: "small", desc: "Small", price: 0),
                Option(id: "medium", desc: "Medium", price: 5.50),
                Option(id: "large", desc: "Large", price: 8.00)
            ], optionSelected: 0),
            Customization(type: "sugar", options: [
                Option(id: "nosugar", desc: "No", price: 0),
                Option(id: "onesugarcube", desc: "1 Packet", price: 0),
                Option(id: "twosugarcube", desc: "2 Packets", price: 0),
                Option(id: "threesugarcube", desc: "3 Packets", price: 0)
            ], optionSelected: 1)
        ]),
        Product(id:"Mocha", name: "Mocha", price: 25.00, image: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FMocha%403x.png?alt=media&token=4131c72c-3906-483c-84ab-8355ac309be0", imageDetail: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/ProductDetail%2FMochaProductDetail.png?alt=media&token=d3d89393-b089-41a7-908f-895a386db968", description: "Un poco de crema batida y una pizca de virutas de chocolate lo son todo para este rico clásico achocolatado.", isAvailable: true, customizations: [
            Customization(type: "Size", options: [
                Option(id: "small", desc: "Small", price: 0),
                Option(id: "medium", desc: "Medium", price: 8.00),
                Option(id: "large", desc: "Large", price: 14.50)
            ], optionSelected: 0),
            Customization(type: "Sugar", options: [
                Option(id: "nosugar", desc: "No", price: 0),
                Option(id: "onesugarcube", desc: "1 Packet", price: 0),
                Option(id: "twosugarcube", desc: "2 Packets", price: 0),
                Option(id: "threesugarcube", desc: "3 Packets", price: 0)
            ], optionSelected: 1),
            Customization(type: "Whipped cream", options: [
                Option(id: "nowhippedcream", desc: "No", price: 0),
                Option(id: "whippedcream", desc: "Yes", price: 0)
            ], optionSelected: 1)
        ])
    ]
    
    static let announcementsData: [SectionAnnouncement] = [
        SectionAnnouncement(id: "Main", title: "Principal", type: "header", announcements: [
            Announcement(title: "Titulo del anuncio1", body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter autem vobis placet. Quae sequuntur igitur? Quid, de quo nulla dissensio est?&nbsp;</p> <p>Duo Reges: constructio interrete. Idem adhuc.</p> <p>Putabam equidem satis, inquit, me dixisse. At multis se probavit. Nunc de hominis summo bono quaeritur; Ratio enim nostra consentit, pugnat oratio.</p> <ul>     <li>Age sane, inquam.</li>     <li>Cum id fugiunt, re eadem defendunt, quae Peripatetici, verba.</li>     <li>Ergo id est convenienter naturae vivere, a natura discedere.</li> </ul> <ol>     <li>Summus dolor plures dies manere non potest?</li>     <li>Aperiendum est igitur, quid sit voluptas.</li>     <li>Praeteritis, inquit, gaudeo.</li> </ol> <p><br></p> <p><a href='http://loripsum.net/' target='_blank'>Poterat autem inpune</a></p>", imageURL: "gooddaycoffe", category: "announcement", createAt: Timestamp()),
            Announcement(title: "Titulo del anuncio2", body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter autem vobis placet. Quae sequuntur igitur? Quid, de quo nulla dissensio est?&nbsp;</p> <p>Duo Reges: constructio interrete. Idem adhuc.</p> <p>Putabam equidem satis, inquit, me dixisse. At multis se probavit. Nunc de hominis summo bono quaeritur; Ratio enim nostra consentit, pugnat oratio.</p> <ul>     <li>Age sane, inquam.</li>     <li>Cum id fugiunt, re eadem defendunt, quae Peripatetici, verba.</li>     <li>Ergo id est convenienter naturae vivere, a natura discedere.</li> </ul> <ol>     <li>Summus dolor plures dies manere non potest?</li>     <li>Aperiendum est igitur, quid sit voluptas.</li>     <li>Praeteritis, inquit, gaudeo.</li> </ol> <p><br></p> <p><a href='http://loripsum.net/' target='_blank'>Poterat autem inpune</a></p>", imageURL: "gooddaycoffe", category: "announcement", createAt: Timestamp())
        ]),
        
        SectionAnnouncement(id: "Newsletters", title: "Newsletters", type: "normal", announcements: [
            Announcement(title: "Guarda tus favoritos", body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter autem vobis placet. Quae sequuntur igitur? Quid, de quo nulla dissensio est?&nbsp;</p> <p>Duo Reges: constructio interrete. Idem adhuc.</p> <p>Putabam equidem satis, inquit, me dixisse. At multis se probavit. Nunc de hominis summo bono quaeritur; Ratio enim nostra consentit, pugnat oratio.</p> <ul>     <li>Age sane, inquam.</li>     <li>Cum id fugiunt, re eadem defendunt, quae Peripatetici, verba.</li>     <li>Ergo id est convenienter naturae vivere, a natura discedere.</li> </ul>", imageURL: "newsletter", category: "newsletter", createAt: Timestamp()),
            Announcement(title: "Compartir en familia", body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter autem vobis placet. Quae sequuntur igitur? Quid, de quo nulla dissensio est?&nbsp;</p> <p>Duo Reges: constructio interrete. Idem adhuc.</p> <p>Putabam equidem satis, inquit, me dixisse. At multis se probavit. Nunc de hominis summo bono quaeritur; Ratio enim nostra consentit, pugnat oratio.</p> <ul>     <li>Age sane, inquam.</li>     <li>Cum id fugiunt, re eadem defendunt, quae Peripatetici, verba.</li>     <li>Ergo id est convenienter naturae vivere, a natura discedere.</li> </ul>", imageURL: "newsletter", category: "newsletter", createAt: Timestamp()),
            Announcement(title: "Obten una taza personalizada Hoy!", body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter autem vobis placet. Quae sequuntur igitur? Quid, de quo nulla dissensio est?&nbsp;</p> <p>Duo Reges: constructio interrete. Idem adhuc.</p> <p>Putabam equidem satis, inquit, me dixisse. At multis se probavit. Nunc de hominis summo bono quaeritur; Ratio enim nostra consentit, pugnat oratio.</p> <ul>     <li>Age sane, inquam.</li>     <li>Cum id fugiunt, re eadem defendunt, quae Peripatetici, verba.</li>     <li>Ergo id est convenienter naturae vivere, a natura discedere.</li> </ul>", imageURL: "newsletter", category: "newsletter", createAt: Timestamp()),
            Announcement(title: "Vamos con tokyo", body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter autem vobis placet. Quae sequuntur igitur? Quid, de quo nulla dissensio est?&nbsp;</p> <p>Duo Reges: constructio interrete. Idem adhuc.</p> <p>Putabam equidem satis, inquit, me dixisse. At multis se probavit. Nunc de hominis summo bono quaeritur; Ratio enim nostra consentit, pugnat oratio.</p> <ul>     <li>Age sane, inquam.</li>     <li>Cum id fugiunt, re eadem defendunt, quae Peripatetici, verba.</li>     <li>Ergo id est convenienter naturae vivere, a natura discedere.</li> </ul>", imageURL: "newsletter", category: "newsletter", createAt: Timestamp())
        ]),
        
        SectionAnnouncement(id: "Promotions", title: "Promotions", type: "normal", announcements: [
            Announcement(title: "2x1 En bebidas frias", body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter autem vobis placet. Quae sequuntur igitur? Quid, de quo nulla dissensio est?&nbsp;</p> <p>Duo Reges: constructio interrete. Idem adhuc.</p> <p>Putabam equidem satis, inquit, me dixisse. At multis se probavit. Nunc de hominis summo bono quaeritur; Ratio enim nostra consentit, pugnat oratio.</p> <ul>     <li>Age sane, inquam.</li>     <li>Cum id fugiunt, re eadem defendunt, quae Peripatetici, verba.</li>     <li>Ergo id est convenienter naturae vivere, a natura discedere.</li> </ul>", imageURL: "promotion", category: "promotion", createAt: Timestamp()),
            Announcement(title: "Comparte y gana 10% de descuento", body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter autem vobis placet. Quae sequuntur igitur? Quid, de quo nulla dissensio est?&nbsp;</p> <p>Duo Reges: constructio interrete. Idem adhuc.</p> <p>Putabam equidem satis, inquit, me dixisse. At multis se probavit. Nunc de hominis summo bono quaeritur; Ratio enim nostra consentit, pugnat oratio.</p> <ul>     <li>Age sane, inquam.</li>     <li>Cum id fugiunt, re eadem defendunt, quae Peripatetici, verba.</li>     <li>Ergo id est convenienter naturae vivere, a natura discedere.</li> </ul>", imageURL: "promotion", category: "promotion", createAt: Timestamp()),
            Announcement(title: "Frio y Caliente", body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter autem vobis placet. Quae sequuntur igitur? Quid, de quo nulla dissensio est?&nbsp;</p> <p>Duo Reges: constructio interrete. Idem adhuc.</p> <p>Putabam equidem satis, inquit, me dixisse. At multis se probavit. Nunc de hominis summo bono quaeritur; Ratio enim nostra consentit, pugnat oratio.</p> <ul>     <li>Age sane, inquam.</li>     <li>Cum id fugiunt, re eadem defendunt, quae Peripatetici, verba.</li>     <li>Ergo id est convenienter naturae vivere, a natura discedere.</li> </ul>", imageURL: "promotion", category: "promotion", createAt: Timestamp()),
            Announcement(title: "Gana un café al completar la encuesta", body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter autem vobis placet. Quae sequuntur igitur? Quid, de quo nulla dissensio est?&nbsp;</p> <p>Duo Reges: constructio interrete. Idem adhuc.</p> <p>Putabam equidem satis, inquit, me dixisse. At multis se probavit. Nunc de hominis summo bono quaeritur; Ratio enim nostra consentit, pugnat oratio.</p> <ul>     <li>Age sane, inquam.</li>     <li>Cum id fugiunt, re eadem defendunt, quae Peripatetici, verba.</li>     <li>Ergo id est convenienter naturae vivere, a natura discedere.</li> </ul>", imageURL: "promotion", category: "promotion", createAt: Timestamp())
            
        ])
        
    ]
}
