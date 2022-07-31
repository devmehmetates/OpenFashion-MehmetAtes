//
//  TabBar.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 31.07.2022.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
    }
}

// MARK: - Configure
extension TabBar {
    
    private func configureContents() {
        view.backgroundColor = .white
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        configureViewControllers()
    }
    
    private func configureViewControllers() {
          viewControllers = [
            configureTabbarButton(for: HomeViewController(), title: AppTexts.home, image: UIImage(named: IconNames.galleryIcon)!),
            configureTabbarButton(for: SomeViewController(), title: AppTexts.search, image: UIImage(named: IconNames.searchIcon)!),
            configureTabbarButton(for: SomeViewController(), title: AppTexts.shoppingBag, image: UIImage(named: IconNames.shoppingbagIcon)!),
            configureTabbarButton(for: SomeViewController(), title: AppTexts.orders, image: UIImage(named: IconNames.shippingIcon)!)
          ]
      }
    
    private func configureTabbarButton(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        rootViewController.navigationItem.titleView = configureNavBarLogo()
        return navController
    }
    
    private func configureNavBarLogo() -> UIView {
        let imageContainer = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: IconNames.logoIcon)
        imageView.image = image
        imageContainer.addSubview(imageView)
        return imageContainer
    }
}
