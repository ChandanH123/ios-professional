//
//  MainViewController.swift
//  Bankey
//
//  Created by Chandan on 23/08/22.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }
    
    private func setupViews() {
        let summaryVC = AccountSummaryViewController()
        let moneyVC = MoveMoneyViewController()
        let moreVC = MoreViewController()
        
        
        summaryVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary") // this function is defined by us to set the tabbarimage name and title.
        moneyVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move Money") // this function is defined by us to set the tabbarimage name and title.
        moreVC.setTabBarImage(imageName: "ellipsis.circle", title: "More") // this function is defined by us to set the tabbarimage name and title.
        
        let summaryNC = UINavigationController(rootViewController: summaryVC) // this is used for navigating the view.
        let moneyNC = UINavigationController(rootViewController: moneyVC) // this is used for navigating the view.
        let moreNC = UINavigationController(rootViewController: moreVC) // this is used for navigating the view.
        
        summaryNC.navigationBar.barTintColor = appColor // this used to set the navigation bar tint color.
        hideNavigationBarLine(summaryNC.navigationBar) // this is used to hide the navigation bar line.
        
        let tabBarList = [summaryNC, moneyNC, moreNC]
        
        viewControllers = tabBarList
        
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupTabBar() {
        tabBar.tintColor = appColor // this used to set the tab bar icon tint color.
        tabBar.isTranslucent = false
    }
}

class MoveMoneyViewController: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
    }
}


class MoreViewController: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
}
