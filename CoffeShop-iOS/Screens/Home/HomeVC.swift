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
        setupRefreshControl()
        updateAnnouncements()
    }
    
    private func setup() {
        view.backgroundColor = CustomColors.backgroundColor        
        navigationItem.title = "Welcome back!"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .none
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(AnnouncementCell.self, forCellWithReuseIdentifier: AnnouncementCell.cellID)
        collectionView.register(NewsletterCell.self, forCellWithReuseIdentifier: NewsletterCell.cellID)
        collectionView.register(SectionHeaderReusableView.self, forSupplementaryViewOfKind: "sectionTitle", withReuseIdentifier: SectionHeaderReusableView.reusableID)
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    private func setupRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(updateAnnouncements), for: .valueChanged)
        collectionView.refreshControl = refreshControl
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
            // set an identifier section
            sectionHeader.showAllButton.tag = indexPath.section
            sectionHeader.showAllButton.addTarget(self, action: #selector(self.showAllSection), for: .touchUpInside)
            return sectionHeader
        }
    }
    
    @objc private func showAllSection(_ sender: UIButton) {
        let sectionIndexSelected = sender.tag
        let sectionSelected = self.sections[sectionIndexSelected]
        let listOfSectionVC = AnnouncementListOfSectionVC(section: sectionSelected)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(listOfSectionVC, animated: true)
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
    
    @objc private func updateAnnouncements() {
        showLoadingView()
        announcementModel.getAllSectionAnnouncements { [weak self] (sections) in
            guard let self = self else { return }
            self.dismissLoadingView()
            self.sections = sections
            self.updateDataSourceSnapshot()
            DispatchQueue.main.async {
                self.collectionView.refreshControl?.endRefreshing()
            }
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
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 40, trailing: 10)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 20
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30.0)), elementKind: "sectionTitle", alignment: .topLeading)
        ]
        
        return section
    }
    
}

// UICollectionViewDelegate
extension HomeVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let announcementSelected = self.sections[indexPath.section].announcements[indexPath.row]
        let announcementDetailVC = AnnouncementDetailVC(announcement: announcementSelected)
        
        self.navigationController?.pushViewController(announcementDetailVC, animated: true)
    }
    
}
