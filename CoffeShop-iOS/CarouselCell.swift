//
//  ImageSliderCell.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 11/06/21.
//

import UIKit

class ImageSliderCell: UICollectionViewCell {
    
    static let cellId = "ImageSliderCell"
    private let imagen = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(imagen)
        imagen.translatesAutoresizingMaskIntoConstraints = false
        imagen.image = UIImage(named: "cart")
        
        imagen.anchor(top: topAnchor, left: leadingAnchor, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
    
}
