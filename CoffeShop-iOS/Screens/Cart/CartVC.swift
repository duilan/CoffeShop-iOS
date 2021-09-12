//
//  CartVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 05/09/21.
//

import UIKit
import FirebaseAuth

enum CartSection: CaseIterable {
    case listProducts
}

class CartVC: UIViewController {
    
    private var tableView: UITableView = UITableView(frame: .zero, style: .grouped)
    private var dataSource: CartDataSource!
    private var cartProducts: [CartProduct] = []
    private let cartModel = CartModel()
    private let firebaseAuth = Auth.auth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
        setupTableViewDataSource()
        loadUserCartProducts()
    }
    
    private func setup() {
        view.backgroundColor = CustomColors.backgroundColor
        title = "My Order"
    }
    
    func setupEditBarButton() {
        if navigationItem.rightBarButtonItem == nil {
            navigationItem.rightBarButtonItem = editButtonItem
        }
    }
    
    func removeBarEditButtonItem() {
        navigationItem.rightBarButtonItem = nil
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = CustomColors.backgroundColor
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
        tableView.delegate = self
        tableView.register(CartProductCell.self, forCellReuseIdentifier: CartProductCell.cellID)
        tableView.anchor(top: view.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
    
    private func loadUserCartProducts() {
        showLoadingView()
        guard let userEmail = firebaseAuth.currentUser?.email else { return }
        cartModel.getCartProductsOf(userID: userEmail) { [weak self] (products) in
            guard let self = self else { return }
            self.dismissLoadingView()
            self.setupEditBarButton()
            self.createSnapshopt(with: products)
            if products.isEmpty {
                self.removeBarEditButtonItem()
                DispatchQueue.main.async {
                    self.showEmptyStateView(message: "Your shopping cart is empty!\nAdd some products\n☕️👈", imageName: AssetManager.cart, in: self.view)
                }
            }
        }
    }
    
    private func setupTableViewDataSource() {
        dataSource = CartDataSource(tableView: self.tableView)
        // setup swipe delete action od datasource class
        dataSource.deleteClosure = { [weak self] cartProduct in
            self?.deleteCartProduct(cartProduct: cartProduct)
        }
    }
    
    private func createSnapshopt(with products: [CartProduct]) {
        var snapshot = NSDiffableDataSourceSnapshot<CartSection,CartProduct>()
        snapshot.appendSections([.listProducts])
        snapshot.appendItems(products)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    private func deleteCartProduct(cartProduct: CartProduct) {
        guard let userEmail = firebaseAuth.currentUser?.email else { return }
        cartModel.deleteCartProduct(cartProduct: cartProduct, userID: userEmail)        
    }
}

extension CartVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let productSelected = dataSource.itemIdentifier(for: indexPath) else { return }
        let productDetailVC = ProductDetailVC(productSelected)
        productDetailVC.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.navigationController?.present(productDetailVC, animated: true)
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing {
            return .delete
        }
        return .none
    }
}

class CartDataSource: UITableViewDiffableDataSource<CartSection,CartProduct> {
    
    var deleteClosure: ((CartProduct) -> Void)?
    
    init(tableView: UITableView) {
        super.init(tableView: tableView) { (tableView, indexPath, item) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CartProductCell.cellID, for: indexPath) as? CartProductCell else {
                return CartProductCell(style: .default, reuseIdentifier: CartProductCell.cellID)
            }
            cell.configure(with: item)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        if let product = self.itemIdentifier(for: indexPath) {
            tableView.isEditing = true
            deleteClosure?(product)
        }
    }
    
}
