//
//  ProductDetailVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 03/07/21.
//

import UIKit
import Kingfisher

class ProductDetailVC: UIViewController, UIScrollViewDelegate {
    
    // MARK: -  Properties
    private let ImageProductView = UIImageView(frame: .zero)
    private var product: Product
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.delegate = self
        scroll.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
        return scroll
    }()
    
    private lazy var detailContentView: UIView = {
        let v = UIView()
        v.backgroundColor = .brown
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupScrollView()
        setupImageProductView()
        setupDetailContentView()
        
    }
    
    // MARK: -  Initializers
    init(_ product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: -  Methods
    private func setup() {
        view.backgroundColor = CustomColors.backgroundColor
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        title = "Detail"
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        
    }
    
    private func setupDetailContentView() {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.brown.withAlphaComponent(0.1)
        v.layer.cornerRadius = 35
        v.layer.cornerCurve = .continuous
        v.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        v.clipsToBounds = true
        
        scrollView.addSubview(v)
        v.topAnchor.constraint(equalTo: ImageProductView.bottomAnchor,constant: -50).isActive = true
        v.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        v.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        v.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupImageProductView() {
        scrollView.addSubview(ImageProductView)
        ImageProductView.contentMode = .scaleAspectFit
        ImageProductView.layer.zPosition = 10
        
        let url = URL(string: product.image_url)
        ImageProductView.kf.indicatorType = .activity
        ImageProductView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        
        ImageProductView.anchor(top: scrollView.topAnchor , left: nil, right: nil, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 277 , height: 300)
        ImageProductView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    }
    
}
