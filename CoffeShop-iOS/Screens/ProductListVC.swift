//
//  MenuVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 25/06/21.
//

import UIKit

class ProductListVC: UIViewController {
    
    // MARK: -  Properties
    private let tableView = UITableView()
    private var products: [Product] = [
        Product(name: "Expresso Americano", price: 12.50, image_url: "Americano", description: "El café americano se prepara diluyendo un espresso con agua caliente", isAvailable: true),
        Product(name: "Cappuccino", price: 17.00, image_url: "Cappuccino", description: "El café espresso y la espuma de leche se combinan para crear el clásico cappuccino", isAvailable: true),
        Product(name: "Iced Latte", price: 12.50, image_url: "IcedLatte", description: "Despertar con un café frío nunca fue tan delicioso. Espuma de leche, espresso, y estás listo para disfrutar de una refrescante café frío para cualquier momento del día.", isAvailable: true),
        Product(name: "Macchiato", price: 17.00, image_url: "Macchiato", description: "Un café de tueste suave pero lleno de sabor. Añade un poco de espuma de leche y obtendrás un delicioso y cremoso macchiato.", isAvailable: true),
        Product(name: "Mocha", price: 22.00, image_url: "Mocha", description: "Un poco de crema batida y una pizca de virutas de chocolate lo son todo para este rico clásico achocolatado", isAvailable: true)
    ]
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
    }
    
    // MARK: -  Methods
    private func setup() {
        title = "Menu"
        view.backgroundColor = CustomColors.backgroundColor
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 140
        tableView.backgroundColor = CustomColors.backgroundColor
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.cellID)
    }
}

// MARK: -  UITableViewDelegate, UITableViewDataSource
extension ProductListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.cellID, for: indexPath) as? ProductCell else {
            return ProductCell(style: .default, reuseIdentifier: ProductCell.cellID)
        }
        cell.configure(with: products[indexPath.row])
        return cell
    }
    
}
