//
//  HomeInteractor.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 30.01.2023.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {
    var productList: [Product] { get }
}

final class HomeInteractor: HomeInteractorProtocol {
    var productList: [Product] = []
    
    func getProductList(_ offset: Int, limit: Int) {
        DispatchQueue.main.async {
            NetworkManager.shared.apiRequest(HomeViewApiEnum.productPath(offset, limit: limit)) { [weak self] responseResult in
                switch responseResult {
                case .success(let data):
                    guard let data: [Product] = data.decode() else { return }
                    self?.productList = data
                case .failure(let error):
                    print(error)
                    // TODO: Generic Pop Up
                }
            }
        }
    }
}
