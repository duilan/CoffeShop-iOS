//
//  AnnouncementListOfSectionVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 28/08/21.
//

import UIKit

class AnnouncementListOfSectionVC: UIViewController {

    private let section: SectionAnnouncement
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
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
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }        

}
