//
//  ProductDetailVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 03/07/21.
//

import UIKit
import FirebaseAuth

class ProductDetailVC: UIViewController {
    
    private let addToCartButton = CSButtonAddToCart()
    private let headerForView = ProductTableHeaderView()
    private let firebaseAuth = Auth.auth()
    private let cartModel = CartModel()
    
    private var product: Product!
    private var quantity: Int = 1
    private var priceBaseProduct: Double = 0.0
    private var subtotal: Double = 0.0
    
    private var total: Double = 0.0 {
        didSet {
            let textAmount = String(format: "$%.02f", total)
            addToCartButton.setTitleAmount(textAmount)
        }
    }
    
    private lazy var  tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 130, right: 0)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 80
        table.backgroundColor = CustomColors.backgroundColorSecondary
        table.separatorInset = UIEdgeInsets.zero
        table.allowsSelection = false
        table.showsVerticalScrollIndicator = false
        table.register(CustomizeProductCell.self, forCellReuseIdentifier: CustomizeProductCell.cellID)
        table.register(ProductQuantityCell.self, forCellReuseIdentifier: ProductQuantityCell.cellID)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
        setupCloseButton()
        setupAddToCartButton()
    }
    
    init(_ product: Product) {
        super.init(nibName: nil, bundle: nil)
        self.product = product
        self.priceBaseProduct = product.price
        calculateTotalPrice()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        view.backgroundColor = CustomColors.backgroundColor
        title = "Detail"        
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        
        headerForView.configure(with: product)
        tableView.tableHeaderView = headerForView
        headerForView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        headerForView.widthAnchor.constraint(equalTo: tableView.widthAnchor).isActive = true
        headerForView.topAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
    }
    
    private func resizeTableHeaderView(){
        guard let headerView = tableView.tableHeaderView else { return }
        let headerContentHeight = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        if headerView.frame.size.height != headerContentHeight {
            headerView.frame.size.height = headerContentHeight
            tableView.tableHeaderView = headerView
        }
    }
    
    private func setupCloseButton() {
        let closeButton = UIButton()
        let iconClose = UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.tintColor = CustomColors.navbarTextColor
        closeButton.setImage( iconClose, for: .normal)
        closeButton.backgroundColor = CustomColors.backgroundColor
        closeButton.layer.cornerRadius = 20
        closeButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 10, paddingLeft: 15, paddingRight: 0, paddingBottom: 0, width: 40, height: 40)
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupAddToCartButton() {
        view.addSubview(addToCartButton)
        addToCartButton.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
        addToCartButton.anchor(top: nil, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingTop: 0, paddingLeft: 20, paddingRight: 20, paddingBottom: 30, width: 0, height: 50)
    }
    
    @objc private func addToCartButtonTapped() {
        
        guard let userID = firebaseAuth.currentUser?.email else { return }
        
        let newCartProduct = CartProduct(product: self.product, quantity: self.quantity, total: self.total)
        cartModel.add(cartProduct: newCartProduct, userID: userID)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resizeTableHeaderView()
    }
}

extension ProductDetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            return nil
        } else {
            let sectionHeaderView = SectionTitleTableView(title: "Customize")
            return sectionHeaderView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat.leastNormalMagnitude
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }
        return 80
    }
}

extension ProductDetailVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return product.customizations.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductQuantityCell.cellID, for: indexPath) as! ProductQuantityCell
            cell.delegate = self
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomizeProductCell.cellID, for: indexPath)  as? CustomizeProductCell else {
            return CustomizeProductCell(style: .default, reuseIdentifier: CustomizeProductCell.cellID)
        }
        
        let customization = product.customizations[indexPath.row]
        cell.configure(with: customization, identifier: indexPath.row)
        cell.delegate = self
        return cell as UITableViewCell
    }
    
    func totalPriceCustomizationsSelected() -> Double {
        var totalCustomizationsSelected: Double = 0
        for customization in product.customizations {
            let Optionselected = customization.optionSelected
            let priceCustomizationSelected = customization.options[Optionselected].price
            totalCustomizationsSelected += priceCustomizationSelected
            
        }
        return totalCustomizationsSelected
    }
    
    func calculateTotalPrice() {
        subtotal = priceBaseProduct + totalPriceCustomizationsSelected()
        total = subtotal * Double(quantity)
    }
}

extension ProductDetailVC: CustomizeProductCellProtocol {
    func customizationSelected(type: String, cellIndexPath: Int, IndexSelectection: Int) {
        product.customizations[cellIndexPath].optionSelected = IndexSelectection
        calculateTotalPrice()
    }
}

extension ProductDetailVC: ProductQuantityCellProtocol {
    func quantityValueChanged(quantity: Int) {
        self.quantity = quantity
        calculateTotalPrice()
    }
}
