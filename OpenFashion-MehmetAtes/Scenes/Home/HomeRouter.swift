//
//  HomeRouter.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 30.01.2023.
//

import UIKit

protocol HomeRouterProtocol: AnyObject {
}

final class HomeRouter: HomeRouterProtocol {
    
    private weak var navigationController: UINavigationController?
    
    static func createModule(using navigationController: UINavigationController) -> HomeViewController {
        let router = HomeRouter()
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        router.navigationController = navigationController
        
        return view
    }
}
