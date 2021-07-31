//
//  ProductQuantityCell.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 22/07/21.
//

import UIKit

protocol ProductQuantityCellProtocol: class {
    func quantityValueChanged(quantity: Int)
}

class ProductQuantityCell: UITableViewCell {
    
    static let cellID = "ProductQuantityCell"
    
    private let quantityLabel = CSTitleLabel(fontSize: 22, fontWeight: .regular, textAlignment: .center)
    
    var quantity: Int = 1 {
        didSet {
            quantityLabel.text = "\(quantity)"
            delegate?.quantityValueChanged(quantity: quantity)
        }
    }
    
    weak var delegate: ProductQuantityCellProtocol?
    
    private lazy var decreaseButton : UIButton = {
        let btn = UIButton()
        let icon = UIImage(systemName: "minus.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 35, weight: .light))
        btn.tintColor = CustomColors.primaryColor
        btn.setImage(icon, for: .normal)
        return btn
    }()
    
    private lazy var increaseButton : UIButton = {
        let btn = UIButton(type: .custom)
        let icon = UIImage(systemName: "plus.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 35, weight: .light))
        btn.tintColor = CustomColors.primaryColor
        btn.setImage(icon, for: .normal)
        return btn
    }()
    
    private lazy var stackView: UIStackView = {
        let s = UIStackView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.axis = .horizontal
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 5
        return s
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupActionButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func decreaseButtonTapped() {
        if quantity > 1 {
            DispatchQueue.main.async {
                self.quantity -= 1
                self.decreaseButton.pulseAnimation()
            }
        }
    }
    
    @objc private func increaseButtonTapped() {
        DispatchQueue.main.async {
            self.quantity += 1
            self.increaseButton.pulseAnimation()
        }
    }
    
    private func setupUI() {
        backgroundColor = CustomColors.backgroundColorSecondary
        quantityLabel.textColor = CustomColors.textPrimaryColor
        quantityLabel.text = "\(quantity)"
        
        stackView.addArrangedSubview(decreaseButton)
        stackView.addArrangedSubview(quantityLabel)
        stackView.addArrangedSubview(increaseButton)
        contentView.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo:  contentView.centerYAnchor).isActive = true 
    }
    
    private func setupActionButtons() {
        increaseButton.addTarget(self, action: #selector(increaseButtonTapped), for: .touchUpInside)
        decreaseButton.addTarget(self, action: #selector(decreaseButtonTapped), for: .touchUpInside)
    }
    
}
