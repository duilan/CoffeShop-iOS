//
//  ShopModel.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 03/08/21.
//

import Foundation

struct ShopModel {
    let shops: [Shop] = [
        Shop(id: "CS1", name: "Santo Tomás", address: "Calle Santo Tomás, Cuauhtémoc, 06060 Ciudad de México, México", latitude: 19.427271821196612, longitude: -99.12627266528202),
        Shop(id: "CS2", name: "Viaducto 1", address: "Viaducto Presidente Miguel Alemán, Piedad Narvarte, 03000 Ciudad de México, México", latitude: 19.4038828686858, longitude: -99.15681399541693),
        Shop(id: "CS3", name: "Areonáutica", address: "Calle Sur 109, Aeronáutica militar, 15970 Ciudad de México, México", latitude: 19.42111096383475, longitude: -99.11528777258876),
        Shop(id: "CS4", name: "El parque", address: "Jardin Balbuena, Avenida Fray Servando Teresa de Mier, Del Parque, 15970 Ciudad de México, México", latitude: 19.422118174089448, longitude: -99.1206713727411)
    ]
    
    func getShopBy(id: String) -> Shop? {
        let shop = shops.first(where: {$0.id == id})
        return shop
    }
}
