//
//  CartVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 05/09/21.
//

import UIKit
import FirebaseAuth

class CartVC: UIViewController {
    
    private var tableView: UITableView!
    private var dataSource: UITableViewDiffableDataSource<Section, CartProduct>!
    private var cartProducts: [CartProduct] = []
    private let cartModel = CartModel()
    private let firebaseAuth = Auth.auth()
    
    enum Section {
        case main
    }
    
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
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero, style: .plain)
        view.addSubview(tableView)
        tableView.backgroundColor = CustomColors.backgroundColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CartProductCell.self, forCellReuseIdentifier: CartProductCell.cellID)
        tableView.anchor(top: view.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
    
    private func loadUserCartProducts() {
        guard let userEmail = firebaseAuth.currentUser?.email else { return }
        showLoadingView()
        cartModel.getCartProductsOf(userID: userEmail) { [weak self](products) in
            guard let self = self else { return }
            self.dismissLoadingView()
            self.cartProducts = products
            self.createSnapshopt()
        }
    }
    
    private func setupTableViewDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { (tableView, IndexPath, item) -> UITableViewCell? in
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CartProductCell.cellID, for: IndexPath) as? CartProductCell else {
                return CartProductCell()
            }
            cell.configure(with: item)
            return cell
        })
    }
    
    private func createSnapshopt() {
        var snapshot = NSDiffableDataSourceSnapshot<Section,CartProduct>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cartProducts)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
}
