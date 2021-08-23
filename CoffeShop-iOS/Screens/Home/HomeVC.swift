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
    
    private enum SectionLayotKind: CaseIterable {
        case main, news, promotions
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
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .none
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(AnnouncementCell.self, forCellWithReuseIdentifier: AnnouncementCell.cellID)
        collectionView.register(NewsletterCell.self, forCellWithReuseIdentifier: NewsletterCell.cellID)
        collectionView.register(SectionHeaderReusableView.self, forSupplementaryViewOfKind: "sectionTitle", withReuseIdentifier: SectionHeaderReusableView.reusableID)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
}

extension HomeVC {
    
    private func generateLayout()->UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            let sectionLayoutKind = SectionLayotKind.allCases[sectionIndex]
            
            switch sectionLayoutKind {
            case .main:
                return  self?.createLargeLayout()
            case .news:
                return self?.createSmallLayout()
            case .promotions:
                return self?.createSmallLayout()
            }
        }
        return layout
        
    }
    
    private func createLargeLayout() -> NSCollectionLayoutSection {
        
        let itemLargeSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let itemLarge = NSCollectionLayoutItem(layoutSize: itemLargeSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemLarge])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    private func createSmallLayout() -> NSCollectionLayoutSection {
        
        let itemSmallSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let itemSmall = NSCollectionLayoutItem(layoutSize: itemSmallSize)
        
        let groupSmallSize = NSCollectionLayoutSize(widthDimension: .absolute(260), heightDimension: .absolute(120))
        let groupSmall = NSCollectionLayoutGroup.horizontal(layoutSize: groupSmallSize, subitems: [itemSmall])
        
        let section = NSCollectionLayoutSection(group: groupSmall)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 40, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 20
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30.0)), elementKind: "sectionTitle", alignment: .topLeading)
        ]
        
        return section
    }
    
    private func configureDataSource() {
        
    }
    
}

extension HomeVC: UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionLayotKind.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionLayoutKind = SectionLayotKind.allCases[indexPath.section]
        
        switch sectionLayoutKind {
        case .main:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnnouncementCell.cellID, for: indexPath) as? AnnouncementCell else {
                return AnnouncementCell()
            }
            cell.set(image: AssetManager.gooddaycoffe)
            return cell
            
        case .news:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsletterCell.cellID, for: indexPath) as? NewsletterCell else {
                return NewsletterCell()
            }
            cell.set(image: AssetManager.newsletter)
            return cell
        case .promotions:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsletterCell.cellID, for: indexPath) as? NewsletterCell else {
                return NewsletterCell()
            }
            cell.set(image: AssetManager.promotion)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderReusableView.reusableID, for: indexPath) as? SectionHeaderReusableView else {
            return SectionHeaderReusableView()
        }
        
        let titleSectionKind = "\(SectionLayotKind.allCases[indexPath.section])"
        sectionHeader.set(title: titleSectionKind)
        
        return sectionHeader
    }
    
}
