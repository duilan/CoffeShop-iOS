//
//  AnnouncementListOfSectionVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 28/08/21.
//

import UIKit

class AnnouncementListOfSectionVC: UIViewController {
    
    private var tableView: UITableView!
    private var dataSource: UITableViewDiffableDataSource<Section, Announcement>!
    
    private let section: SectionAnnouncement
    
    private enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
        setupTableViewDataSource()
        createSnapshot()
    }
    
    init(section: SectionAnnouncement) {
        self.section = section
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        title = section.title
        view.backgroundColor = CustomColors.backgroundColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false        
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        tableView.backgroundColor = CustomColors.backgroundColor
        tableView.delegate = self
    }
    
    private func setupTableViewDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { (tableView, indexPath, item) -> UITableViewCell? in
            
            //CREAR UNA VIEW CELL CUSTOM
            let cell = UITableViewCell()
            cell.backgroundColor = CustomColors.backgroundColor
            cell.textLabel?.text = "\(item.title)"
            cell.imageView?.image = UIImage(named: item.imageURL)
            cell.textLabel?.textColor = CustomColors.textPrimaryColor
            return cell
        })
    }
    
    private func createSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section,Announcement>()
        snapshot.appendSections([.main])
        snapshot.appendItems(section.announcements)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
}


// MARK: -  UITableViewDelegate
extension AnnouncementListOfSectionVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard  let announcementSelected = dataSource.itemIdentifier(for: indexPath) else { return }
        
        let announcementDetailVC = AnnouncementDetailVC(announcement: announcementSelected)                        
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(announcementDetailVC, animated: true)
        }
    }
}
