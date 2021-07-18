//
//  ProductDetailVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 03/07/21.
//

import UIKit

class ProductDetailVC: UIViewController {
    
    private let addToCartButton = CSButtonFilled("Add to cart", color: UIColor(red: 0.302, green: 0.624, blue: 0.533, alpha: 1))
    private let headerForView = ProductTableHeaderView()
    
    var product: Product
    
    private lazy var  tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 130, right: 0)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 80
        table.backgroundColor = CustomColors.backgroundColor
        table.separatorInset = UIEdgeInsets.zero
        table.allowsSelection = false
        table.showsVerticalScrollIndicator = false
        table.register(CustomizeProductCell.self, forCellReuseIdentifier: CustomizeProductCell.cellID)
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
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        view.backgroundColor = CustomColors.backgroundColor
        title = "Detail"        
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        
        headerForView.configure(with: product)
        tableView.tableHeaderView = headerForView
        headerForView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        headerForView.widthAnchor.constraint(equalTo: tableView.widthAnchor).isActive = true
        headerForView.topAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
    }
    
    func resizeTableHeaderView(){
        guard let headerView = tableView.tableHeaderView else { return }
        //print("tamaño actual: \(headerView.frame.size.height)")
        let headerContentHeight = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        if headerView.frame.size.height != headerContentHeight {
            //print("el tamaño del header y del conteniedo son diferentes, hay que igualarlos para qe se visualize correctamente el contenido")
            //print("se remplazara  \(headerView.frame.size.height) por \(headerContentHeight)")
            headerView.frame.size.height = headerContentHeight
            tableView.tableHeaderView = headerView
            //print("tamaño final:  \(headerView.frame.size.height)")
        } else {
            //print("el tamaño del header y del contenido son iguales, todo se visualiza bien")
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
        addToCartButton.anchor(top: nil, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingTop: 0, paddingLeft: 30, paddingRight: 30, paddingBottom: 30, width: 0, height: 50)
    }
    
    @objc func addToCartButtonTapped() {
        let selecciones = product.posibleCustomizations.getOptionsSelected()
        print(selecciones)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resizeTableHeaderView()
    }
}

extension ProductDetailVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        footer.layer.cornerRadius = 35
        footer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        footer.clipsToBounds = true
        footer.backgroundColor = CustomColors.backgroundColorSecondary
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 70
    }
}

extension ProductDetailVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.posibleCustomizations.customizations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomizeProductCell.cellID, for: indexPath)  as? CustomizeProductCell else {
            return CustomizeProductCell(style: .default, reuseIdentifier: CustomizeProductCell.cellID)
        }
        
        let customization = product.posibleCustomizations.customizations[indexPath.row]
        cell.configure(with: customization, identifier: indexPath.row)
        cell.delegate = self
        return cell as UITableViewCell
    }
    
}

extension ProductDetailVC: CustomizeProductCellProtocol {
    func customizationSelected(type: CustomizationType, cellIndexPath: Int, IndexSelectection: Int) {
        product.posibleCustomizations.customizations[cellIndexPath].optionSelected = IndexSelectection
    }
}