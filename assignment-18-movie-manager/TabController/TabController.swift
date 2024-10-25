//
//  TabControllerViewController.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 25.10.24.
//

import UIKit

class TabController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let home = createTab(iconActive: "filmRollActive", iconInactive: "filmRollDeactive", vc: MainScreenVC())
        let detailsScreen = createTab(iconActive: "BookmarkActive", iconInactive: "bookmarkInactive", vc: FavoriteVC())
        
        self.tabBar.backgroundColor = .white
        self.tabBar.itemSpacing = 135
        self.tabBar.itemPositioning = .centered
        
        self.setViewControllers([home, detailsScreen], animated: true )
    }
    
    private func createTab(iconActive: String, iconInactive: String, vc: UIViewController) -> UINavigationController {
        
        let tab = UINavigationController(rootViewController: vc)
        tab.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        tab.tabBarItem.image = UIImage(named: iconInactive)?.withRenderingMode(.alwaysOriginal)
        tab.tabBarItem.selectedImage = UIImage(named: iconActive)?.withRenderingMode(.alwaysOriginal)
        
        return tab
    }

}
