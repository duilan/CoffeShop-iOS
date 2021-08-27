//
//  AnnouncementDetailVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 25/08/21.
//

import UIKit

class AnnouncementDetailVC: UIViewController {
    
    private var announcement: Announcement
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
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
    }
    
}
