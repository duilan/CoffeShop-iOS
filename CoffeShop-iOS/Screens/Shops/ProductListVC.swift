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
    private var products: [Product] = []
    private var filteredProducts: [Product] = []
    private let shopSelected: Shop
    private var isSearching = false
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
        setupSearchController()
        showLoadingView()
        productModel.getProductsMenu(of: shopSelected) { [weak self] (products) in
            guard let self = self else { return }
            self.dismissLoadingView()
            self.products = products
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupCartBarButton()
    }
    
    init(shop: Shop) {
        self.shopSelected = shop
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func setupSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search coffe..."
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupCartBarButton() {
        let cartBarButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(cartBarButtonTapped))
        navigationItem.rightBarButtonItem = cartBarButton
    }
    
    @objc private func cartBarButtonTapped() {
        let cartVC = CartVC()
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(cartVC, animated: true)
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredProducts = products.filter{ $0.name.lowercased().contains(searchText.lowercased()) }
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
}

// MARK: -  UITableViewDelegate, UITableViewDataSource
extension ProductListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredProducts.count
        }
        
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.cellID, for: indexPath) as? ProductCell else {
            return ProductCell(style: .default, reuseIdentifier: ProductCell.cellID)
        }
        let product: Product
        if isSearching {
            product = filteredProducts[indexPath.row]
        } else {
            product = products[indexPath.row]
        }
        
        cell.configure(with: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productSelected: Product
        if isSearching {
            productSelected = filteredProducts[indexPath.row]
        } else {
            productSelected = products[indexPath.row]
        }
        let productDetailVC = ProductDetailVC(productSelected)
        productDetailVC.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.navigationController?.present(productDetailVC, animated: true)
        }
    }
}

extension ProductListVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filterText  = searchController.searchBar.text, !filterText.isEmpty else {
            isSearching = false
            filteredProducts.removeAll()
            DispatchQueue.main.async { self.tableView.reloadData() }
            return
        }
        isSearching = true
        filterContentForSearchText(filterText)
    }
    
}
