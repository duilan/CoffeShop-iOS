//
//  HomeVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 23/06/21.
//

import UIKit

class HomeVC: UIViewController {
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<SectionAnnouncement, Announcement>!
    private var announcementModel = AnnouncementModel()
    private var sections: [SectionAnnouncement] = []
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupCollectionView()
        setupDataSource()
        setupSectionHeaderView()
        updateAnnouncements()
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
        view.addSubview(collectionView)
    }
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionAnnouncement, Announcement>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            let sectionType = self.sections[indexPath.section].type
            
            if sectionType ==  "header" {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnnouncementCell.cellID, for: indexPath) as? AnnouncementCell else {
                    return AnnouncementCell()
                }
                cell.set(imageName: item.imageURL)
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsletterCell.cellID, for: indexPath) as? NewsletterCell else {
                    return NewsletterCell()
                }
                cell.set(imageName: item.imageURL)
                return cell
            }
        }
    }
    
    private func setupSectionHeaderView() {
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderReusableView.reusableID, for: indexPath) as? SectionHeaderReusableView else {
                return SectionHeaderReusableView()
            }
            
            let sectionTitle = self.sections[indexPath.section].title
            sectionHeader.set(title: sectionTitle)
            return sectionHeader
        }
    }
    
    private func updateDataSourceSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<SectionAnnouncement,Announcement>()
        snapshot.appendSections(sections)
        sections.forEach { (section) in
            snapshot.appendItems(section.announcements, toSection: section)
        }
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
    
    private func updateAnnouncements() {
        announcementModel.getAllSectionAnnouncements { [weak self] (sections) in
            self?.sections = sections
            self?.updateDataSourceSnapshot()
        }
    }
    
}

extension HomeVC {
    
    private func generateLayout()->UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { [unowned self] (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            let sectionType = self.sections[sectionIndex].type
            
            if sectionType ==  "header" {
                return  self.createHeaderLayout()
            } else {
                return  self.createNormalLayout()
            }
        }
        return layout
        
    }
    
    private func createHeaderLayout() -> NSCollectionLayoutSection {
        
        let itemLargeSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let itemLarge = NSCollectionLayoutItem(layoutSize: itemLargeSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemLarge])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    private func createNormalLayout() -> NSCollectionLayoutSection {
        
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
    
}
