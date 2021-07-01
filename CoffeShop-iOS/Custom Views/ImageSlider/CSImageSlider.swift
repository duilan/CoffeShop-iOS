//
//  CSImageSlider.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 11/06/21.
//

import UIKit

protocol ImagenSliderDelegate: class {
    func imagenSliderDidChangeImage(index currentImagenIndex:Int )
}

class CSImageSlider: UIView {
    
    // MARK: -  Properties
    private var images = [UIImage?]()
    private var currentPage = 0
    
    weak var delegate: ImagenSliderDelegate?
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.register(CSImageSliderCell.self, forCellWithReuseIdentifier: CSImageSliderCell.cellId)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        collection.backgroundColor = .clear
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    // MARK: -  Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCollectionView()
    }
    
    // MARK: -  Public Methods
    
    func configure(with images: [UIImage?] ) {
        self.images = images
    }
    
    func changeImage(itemIndex: Int)  {
        collectionView.scrollToItem(at: IndexPath(item: itemIndex , section: 0), at: .centeredHorizontally, animated: true)
    }
    
    // MARK: -  Private Methods
    
    private func setupCollectionView()  {
        addSubview(collectionView)
        collectionView.collectionViewLayout = UIHelper.createOneColumnFlowLayout(in: self, padding: 10)
        collectionView.anchor(top: topAnchor, left: leadingAnchor, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
    
}

// MARK: -  Collection DataSource & Delegate
extension CSImageSlider: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CSImageSliderCell.cellId, for: indexPath) as? CSImageSliderCell else {
            return UICollectionViewCell()
        }
        
        let image = images[indexPath.row]
        cell.configure(with: image)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let currentPage = Int(offSet / width)
        if currentPage != self.currentPage {
            self.currentPage = currentPage
            delegate?.imagenSliderDidChangeImage(index: currentPage)
        }
    }
}
