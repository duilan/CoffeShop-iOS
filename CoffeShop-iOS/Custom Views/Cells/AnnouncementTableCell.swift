//
//  AnnouncementTableCell.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 02/09/21.
//

import UIKit

class AnnouncementTableCell: UITableViewCell {
    
    static let cellID = "AnnouncementTableCell"
    
    private let titleLabel = CSTitleLabel(fontSize: 14, fontWeight: .semibold, textAlignment: .left)
    private let mainImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(announcement: Announcement) {
        mainImageView.image = UIImage(named: announcement.imageURL) ?? UIImage(named: AssetManager.newsletter)
        titleLabel.text = announcement.title
    }
    
    
    private func setup() {
        // cell
        backgroundColor = CustomColors.backgroundColor
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        separatorInset =  UIEdgeInsets.init(top: 0.0, left: 145.0, bottom: 0.0, right: 25.0)
        
        // image
        contentView.addSubview(mainImageView)
        
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.clipsToBounds = true
        mainImageView.layer.cornerRadius = 10
        mainImageView.layer.cornerCurve = .continuous
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        // title
        contentView.addSubview(titleLabel)
        
        titleLabel.textColor = CustomColors.textPrimaryColor
        titleLabel.numberOfLines = 2
        titleLabel.adjustsFontSizeToFitWidth = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        
    }
    
}
