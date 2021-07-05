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
        Product(name: "Expresso Americano", price: 12.50, image_url: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FAmericano%403x.png?alt=media&token=417cc630-0a23-4ec7-ad6b-71c16b78c864", image_detail_url: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/coffe%2FAmericanoProduct%403x.png?alt=media&token=c2c72068-1544-4a59-8124-986a62a8227f", description: "El café americano se prepara diluyendo un espresso con agua caliente", isAvailable: true),
        Product(name: "Cappuccino", price: 17.00, image_url: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FCappuccino%403x.png?alt=media&token=bdc17b04-466e-475f-816c-ef2684dfe354", image_detail_url: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/coffe%2FcappuchinoProduct%403x.png?alt=media&token=bb71529f-1c7e-4f81-9937-dbfc1d863a69", description: "El café espresso y la espuma de leche se combinan para crear el clásico cappuccino", isAvailable: true),
        Product(name: "Iced Latte", price: 12.50, image_url: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FIcedLatte%403x.png?alt=media&token=7bbb22d0-daed-4912-95d0-6687f4ed4e90", image_detail_url: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/coffe%2FIcedLatteProduct%403x.png?alt=media&token=8e266bf7-7257-482c-b4c1-a77648d589cb", description: "Despertar con un café frío nunca fue tan delicioso. Espuma de leche, espresso, y estás listo para disfrutar de una refrescante café frío para cualquier momento del día.", isAvailable: true),
        Product(name: "Macchiato", price: 17.00, image_url: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FMacchiato%403x.png?alt=media&token=20234318-43be-4bfd-8467-47e74957e896", image_detail_url: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/coffe%2FMacchiatoProduct%403x.png?alt=media&token=8e64f492-e108-4f37-9784-90a12b170f99", description: "Un café de tueste suave pero lleno de sabor. Añade un poco de espuma de leche y obtendrás un delicioso y cremoso macchiato.", isAvailable: true),
        Product(name: "Mocha", price: 22.00, image_url: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/Drinks%2FMocha%403x.png?alt=media&token=4131c72c-3906-483c-84ab-8355ac309be0", image_detail_url: "https://firebasestorage.googleapis.com/v0/b/coffe-shop-14d3f.appspot.com/o/coffe%2FmochaProduct%403x.png?alt=media&token=89f471a2-f85a-4358-85ba-389c0dfc0d08", description: "Un poco de crema batida y una pizca de virutas de chocolate lo son todo para este rico clásico achocolatado", isAvailable: true)
        
        
      
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productSelected = products[indexPath.row]
        let productDetailVC = ProductDetailVC(productSelected)
        
        productDetailVC.modalPresentationStyle = .overFullScreen
        DispatchQueue.main.async {            
            self.navigationController?.present(productDetailVC, animated: true)
        }
    }
}
