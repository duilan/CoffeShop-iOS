//
//  AnnouncementCell.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 21/08/21.
//

import UIKit

class AnnouncementCell: UICollectionViewCell {
    
    static let cellID = "AnnouncementCell"
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(image: String?) {
        imageView.image = UIImage(named: image ?? AssetManager.gooddaycoffe)
    }
    
    private func setupImageView() {
        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.layer.cornerCurve = .continuous        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.anchor(top: contentView.topAnchor, left: contentView.leadingAnchor, right: contentView.trailingAnchor, bottom: contentView.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
    
}
