//
//  HomeVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 23/06/21.
//

import UIKit

class HomeVC: UIViewController {
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<SectionLayotKind, Int>!
    
    private enum SectionLayotKind {
        case main, news
    }
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupCollectionView()
    }
    
    private func setup() {
        view.backgroundColor = CustomColors.backgroundColor
        title = "Welcome Adrian"
    }
    
    private func setupCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createSmallLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .none
        collectionView.register(AnnouncementCell.self, forCellWithReuseIdentifier: AnnouncementCell.cellID)
        collectionView.register(NewsletterCell.self, forCellWithReuseIdentifier: NewsletterCell.cellID)
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
}

extension HomeVC {
    private func createLayout() -> UICollectionViewLayout {
        let itemLargeSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let itemLarge = NSCollectionLayoutItem(layoutSize: itemLargeSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalWidth(0.9))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemLarge])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        
        return layout
    }
    
    private func configureDataSource() {
        
    }
    
    private func createSmallLayout() -> UICollectionViewLayout {
        
        let itemSmallSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let itemSmall = NSCollectionLayoutItem(layoutSize: itemSmallSize)
        
        let groupSmallSize = NSCollectionLayoutSize(widthDimension: .absolute(260), heightDimension: .absolute(120))
        let groupSmall = NSCollectionLayoutGroup.horizontal(layoutSize: groupSmallSize, subitems: [itemSmall])
        
        let section = NSCollectionLayoutSection(group: groupSmall)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.interGroupSpacing = 20
        
        let layout = UICollectionViewCompositionalLayout(section: section)
            
        
        return layout
    }

}

extension HomeVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnnouncementCell.cellID, for: indexPath) as? AnnouncementCell else {
//            return AnnouncementCell()
//        }
        
//        if indexPath.section == 0 {
//            cell.set(image: AssetManager.gooddaycoffe)
//        } else {
//            cell.set(image: AssetManager.marketingNews)
//        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsletterCell.cellID, for: indexPath) as? NewsletterCell else {
            return NewsletterCell()
        }
        
        if indexPath.section == 0 {
            cell.set(image: AssetManager.newsletter)
        } else {
            cell.set(image: AssetManager.marketingNews)
        }
        
        return cell
    }
    
    
}
