//
//  CSImageSliderCell.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 11/06/21.
//

import UIKit

class CSImageSliderCell: UICollectionViewCell {
    // MARK: -  Properties
    static let cellId = "CSImageSliderCell"
    
    private lazy var imagen: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    // MARK: -  Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  Public Methods
    func configure(with image:UIImage?) {
        imagen.image = image ?? UIImage(systemName: "photo")
    }
    // MARK: -  Private Methods
    private func setup() {
        addSubview(imagen)
        imagen.anchor(top: topAnchor, left: leadingAnchor, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
    
}
