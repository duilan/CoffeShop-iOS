//
//  ProductTableHeaderView.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 08/07/21.
//

import UIKit
import Kingfisher

class ProductTableHeaderView: UIView {
    
    private let ImageProductView = UIImageView(frame: .zero)
    private let nameProductLabel = CSTitleLabel(fontSize: 28, fontWeight: .bold ,textAlignment: .center)
    private let descProductLabel = CSBodyLabel(textAlignment: .center)
    private let priceProductLabel = CSTitleLabel(fontSize: 20, fontWeight: .semibold, textAlignment: .center)
    
    private lazy var detailStack: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = .fill
        s.alignment = .center
        s.spacing = 8
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    private lazy var topLine: UIView = {
        let line = UIView()
        line.layer.cornerRadius = 2
        line.backgroundColor = UIColor(red: 0.8, green: 0.58, blue: 0.239, alpha: 1)
        line.clipsToBounds = true
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var detailContentView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = CustomColors.backgroundColorSecondary
        v.layer.cornerRadius = 35
        v.layer.cornerCurve = .continuous
        v.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        v.clipsToBounds = true
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = CustomColors.backgroundColor
        setupImageProductView()
        setupDetailContentView()
        setupStackInfo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with product: Product ) {        
        // Image product
        let urlImage = URL(string: product.image_detail_url)
        ImageProductView.kf.indicatorType = .activity
        ImageProductView.kf.setImage(with: urlImage, options: [.transition(.fade(0.2))])
        // name product
        nameProductLabel.text = product.name
        // desc product
        descProductLabel.text = product.description
        //price product
        priceProductLabel.text = product.priceFormatted()
    }
    
    private func setupImageProductView() {
        addSubview(ImageProductView)
        ImageProductView.contentMode = .scaleAspectFit
        ImageProductView.layer.zPosition = 10
        ImageProductView.kf.indicatorType = .activity
        ImageProductView.translatesAutoresizingMaskIntoConstraints = false
        ImageProductView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        ImageProductView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ImageProductView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        ImageProductView.widthAnchor.constraint(equalToConstant: 350).isActive = true
    }
    
    private func setupDetailContentView() {
        addSubview(detailContentView)
        detailContentView.anchor(top: ImageProductView.bottomAnchor, left: self.leadingAnchor, right: self.trailingAnchor, bottom: self.bottomAnchor, paddingTop: -60, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        
        addSubview(topLine)
        topLine.anchor(top: ImageProductView.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 10, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 30, height: 4)
        topLine.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func setupStackInfo() {
        addSubview(detailStack)
        detailStack.anchor(top: topLine.topAnchor, left: self.leadingAnchor, right: self.trailingAnchor, bottom: self.bottomAnchor, paddingTop: 10, paddingLeft: 35, paddingRight: 35, paddingBottom: 10, width: 0, height: 0)
                
        // name product
        detailStack.addArrangedSubview(nameProductLabel)
        nameProductLabel.textColor = CustomColors.textPrimaryColor
        // desc product
        detailStack.addArrangedSubview(descProductLabel)
        //price product
        detailStack.addArrangedSubview(priceProductLabel)
        priceProductLabel.textColor = UIColor(red: 0.016, green: 0.455, blue: 0.29, alpha: 1)
    }
    
   
    
}
