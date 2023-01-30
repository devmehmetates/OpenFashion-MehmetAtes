//
//  TabBarViewController.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 31.07.2022.
//

import UIKit

// MARK: - Tabbar View
protocol TabBarViewInterface: AnyObject {
    func configureContents()
    func setupViewControllers()
}

final class TabBarViewController: UITabBarController {
    private lazy var homeTab: UIViewController = {
        let navigationController = UINavigationController()
        let viewController = HomeRouter.createModule(using: navigationController)
        viewController.navigationItem.titleView = configureNavBarLogo()
        navigationController.viewControllers = [viewController]
        navigationController.tabBarItem.title = AppTexts.home
        navigationController.tabBarItem.image = UIImage(named: IconNames.galleryIcon) ?? UIImage()
        navigationController.navigationBar.prefersLargeTitles = false
        return navigationController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var presenter: TabBarPresenterInterface? {
        didSet {
            presenter?.notifyViewLoaded()
        }
    }
}

// MARK: View Configure
extension TabBarViewController: TabBarViewInterface {
    func configureContents() {
        tabBar.tintColor = .label
        view.backgroundColor = .systemBackground
    }
    
    func setupViewControllers() {
        viewControllers = [
            homeTab
        ]
    }
}

// MARK: - Tabbar Router
protocol TabBarRouterInterface: AnyObject {}

final class TabBarRouter: TabBarRouterInterface {
    private weak var navigationController: UINavigationController?
    
    static func createModule(using navigationController: UINavigationController) -> TabBarViewController {
        let router = TabBarRouter()
        let view = TabBarViewController()
        let presenter = TabBarPresenter(view: view, router: router)
        
        view.presenter = presenter
        router.navigationController = navigationController
        
        return view
    }
}

// MARK: - TabBar Presenter
protocol TabBarPresenterInterface: AnyObject {
    func notifyViewLoaded()
}

final class TabBarPresenter: TabBarPresenterInterface {
    private weak var view: TabBarViewInterface?
    
    init(view: TabBarViewInterface?, router: TabBarRouterInterface?) {
        self.view = view
    }
    
    func notifyViewLoaded() {
        view?.configureContents()
        view?.setupViewControllers()
    }
}

// MARK: - Logo
extension TabBarViewController {
    private func configureNavBarLogo() -> UIView {
        let imageContainer = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: IconNames.logoIcon)
        imageView.tintColor = .label
        imageView.image = image
        imageContainer.addSubview(imageView)
        return imageContainer
    }
}
