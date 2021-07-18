//
//  CustomizeProductCell.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 17/07/21.
//

import UIKit

protocol CustomizeProductCellProtocol: class {
    func customizationSelected(type: CustomizationType, cellIndexPath: Int, IndexSelectection: Int)
}

class CustomizeProductCell: UITableViewCell {
    
    static let cellID = "CustomizeProductCell"
    private let titleLabel = CSTitleLabel(fontSize: 17, fontWeight: .semibold,textAlignment: .left)
    var segmentControl = UISegmentedControl(frame: .zero)
    private var contumization: Customization!
    private var images: [UIImage] = []
    
    weak var delegate: CustomizeProductCellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTitleLabel()
        setupSegmentControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with custimization: Customization, identifier: Int ) {
        contumization = custimization
        titleLabel.text = custimization.type.rawValue
        segmentControl.tag = identifier
        let  options = custimization.options
        segmentControl.removeAllSegments()
        for (i, option) in options.enumerated() {
            segmentControl.insertSegment(with: UIImage(named: option.id), at: i, animated: false)
        }
        
        if let selected = custimization.optionSelected {
            segmentControl.selectedSegmentIndex = selected
        }
        
    }
    
    private func setupTitleLabel() {
        self.backgroundColor = CustomColors.backgroundColorSecondary
        contentView.addSubview(titleLabel)
        titleLabel.numberOfLines = 1
        titleLabel.textColor = CustomColors.textPrimaryColor
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
    }
    
    @objc func tapped(_ sender: UISegmentedControl) {
        contumization.optionSelected = sender.selectedSegmentIndex
        
        delegate?.customizationSelected(type: contumization.type, cellIndexPath: sender.tag, IndexSelectection: sender.selectedSegmentIndex)
    }
    
    private func setupSegmentControl()  {
        segmentControl.addTarget(self, action: #selector(tapped), for: .valueChanged)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:  CustomColors.primaryColor], for: .selected)
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:  UIColor.gray], for: .normal)
        segmentControl.selectedSegmentTintColor = UIColor.white.withAlphaComponent(0.7)
        
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
