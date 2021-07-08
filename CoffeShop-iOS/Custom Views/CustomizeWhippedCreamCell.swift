//
//  CustomizeWhippedCreamCell.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 08/07/21.
//

import UIKit

class CustomizeWhippedCreamCell: UITableViewCell {
    
    static let cellID = "CustomizeWhippedCreamCell"
    var segmentControl: UISegmentedControl!
    
    private let titleLabel = CSTitleLabel(fontSize: 17, fontWeight: .semibold,textAlignment: .left)
    private let images: [UIImage] = [
        UIImage(named: "nowhippedcream")!,
        UIImage(named: "whippedcream")!,
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTitleLabel()
        setupSegmentControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleLabel() {
        self.backgroundColor = UIColor.brown.withAlphaComponent(0.1)
        self.titleLabel.text = "Wipped Cream"
        contentView.addSubview(titleLabel)
        titleLabel.numberOfLines = 1
        titleLabel.textColor = CustomColors.textPrimaryColor
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
    }
    
    private func setupSegmentControl()  {
        segmentControl = UISegmentedControl(items: images)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:  CustomColors.primaryColor], for: .selected)
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:  UIColor.gray], for: .normal)
        segmentControl.selectedSegmentTintColor = UIColor.white.withAlphaComponent(0.7)
        
        // scaleAspectFit for all images inside the segment
        segmentControl.subviews.flatMap{$0.subviews}.forEach { subview in
            if let imageView = subview as? UIImageView, let image = imageView.image, image.size.width > 5 {
                // The imageView which isn't separator
                imageView.contentMode = .scaleAspectFit
            }
        }
        
        contentView.addSubview(segmentControl)
        segmentControl.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0).isActive = true
        segmentControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        segmentControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        segmentControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
