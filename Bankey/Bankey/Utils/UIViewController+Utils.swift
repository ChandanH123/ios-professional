//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by Chandan on 23/08/22.
//

import UIKit

extension UIViewController {
    
    // Below func is used to show status bar.
    func setStatusBar() {
        let statusBarSize = UIApplication.shared.statusBarFrame.size // deprecated but OK
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusBarView = UIView(frame: frame)
        statusBarView.backgroundColor = appColor
        view.addSubview(statusBarView)
    }
    
    // Below func is used to show tab bar with images.
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
