//
//  AnnouncementDetailVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 25/08/21.
//

import UIKit

class AnnouncementDetailVC: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let imageContainer = UIView()
    private let headerImageView = UIImageView()
    private let titleLabel = CSTitleLabel(fontSize: 24, fontWeight: .black, textAlignment: .left)
    private let bodyTextView = UITextView()
    
    private let announcement: Announcement
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupScrollView()
        setupHeaderImageView()
        setupContentView()
        setupTitleLabel()
        setupBodyTextView()
    }
    
    init(announcement: Announcement) {
        self.announcement = announcement
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        title = announcement.title
        view.backgroundColor = CustomColors.backgroundColor
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    private func setupHeaderImageView() {
        scrollView.addSubview(imageContainer)
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        
        imageContainer.anchor(top: scrollView.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: view.frame.width, height: 0)
        
        // no me gusta esto hahah pero funciona con los anuncios de imagenes mas grandes
        let  minHeightImageCategory: CGFloat = (announcement.category == "announcement") ? 400.0 : 200.0
        imageContainer.heightAnchor.constraint(greaterThanOrEqualToConstant: minHeightImageCategory).isActive = true
        
        scrollView.addSubview(headerImageView)
        headerImageView.image = UIImage(named: self.announcement.imageURL) ?? UIImage(named: AssetManager.gooddaycoffe)
        headerImageView.contentMode = .scaleAspectFill
        headerImageView.clipsToBounds = true
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        
        headerImageView.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor).isActive = true
        headerImageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = true
        let topC = headerImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        topC.priority = UILayoutPriority(999)
        topC.isActive = true
        
        let heightC = headerImageView.heightAnchor.constraint(greaterThanOrEqualTo: imageContainer.heightAnchor)
        heightC.priority = .required
        heightC.isActive = true
        
        headerImageView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.text = self.announcement.title
        titleLabel.textColor = CustomColors.textPrimaryColor
        titleLabel.numberOfLines = 2 // 0 unlimited lines
        titleLabel.anchor(top: imageContainer.bottomAnchor, left: contentView.leadingAnchor, right: contentView.trailingAnchor, bottom: nil, paddingTop: 20, paddingLeft: 20, paddingRight: 20, paddingBottom: 0, width: 0, height: 0)
    }
    
    private func setupBodyTextView() {
        contentView.addSubview(bodyTextView)
        bodyTextView.attributedText = announcement.body.htmlToAttributedString
        bodyTextView.font = UIFont.systemFont(ofSize: 16)
        bodyTextView.textColor = .secondaryLabel
        bodyTextView.backgroundColor = .clear
        bodyTextView.isEditable = false
        bodyTextView.isScrollEnabled = false
        bodyTextView.translatesAutoresizingMaskIntoConstraints = false
        
        bodyTextView.anchor(top: titleLabel.bottomAnchor, left: contentView.leadingAnchor, right: contentView.trailingAnchor, bottom: contentView.bottomAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20, paddingBottom: 0, width: 0, height: 0)
        bodyTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
    }
    
}
