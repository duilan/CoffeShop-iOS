//
//  AnnouncementCell.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 21/08/21.
//

import UIKit
import Kingfisher

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
    
    func set(imageName: String) {
        imageView.image = UIImage(named: imageName) ?? UIImage(named: AssetManager.gooddaycoffe )
    }
    
    func set(imageURL: String) {
        //Image download using Kingfisher
        let url = URL(string: imageURL)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
    
    private func setupImageView() {
        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.anchor(top: contentView.topAnchor, left: contentView.leadingAnchor, right: contentView.trailingAnchor, bottom: contentView.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
    
}
