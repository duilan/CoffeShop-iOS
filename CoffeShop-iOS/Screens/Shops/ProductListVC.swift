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
    private var productModel = ProductModel()
    
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
        return productModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.cellID, for: indexPath) as? ProductCell else {
            return ProductCell(style: .default, reuseIdentifier: ProductCell.cellID)
        }
        
        let product = productModel.products[indexPath.row]
        cell.configure(with: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productSelected = productModel.products[indexPath.row]
        let productDetailVC = ProductDetailVC(productSelected)
        DispatchQueue.main.async {
            self.navigationController?.present(productDetailVC, animated: true)
        }
    }
}
