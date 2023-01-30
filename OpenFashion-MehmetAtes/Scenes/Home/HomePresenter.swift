//
//  HomePresenter.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 30.01.2023.
//

protocol HomePresenterProtocol: AnyObject {
    func notifyViewLoaded()
}

final class HomePresenter {
    private weak var view: HomeViewProtocol?
    private weak var router: HomeRouterProtocol?
    private weak var interactor: HomeInteractorProtocol?
    
    init(view: HomeViewProtocol?, router: HomeRouterProtocol?, interactor: HomeInteractorProtocol?) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

// MARK: - HomePresenterProtocol Stumbs
extension HomePresenter: HomePresenterProtocol {
    func notifyViewLoaded() {
        view?.setupScrollView()
    }
}
