//
//  HomeViewModel.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 1.08.2022.
//

protocol HomeViewModel { }

// MARK: - Network
extension HomeViewModel {
    
    func getProducts(offset: Int? = 0, limit: Int? = 20, result: @escaping ([Product]) -> Void) {
        guard let offset = offset else { return }
        guard let limit = limit else { return }
        NetworkService<DummyModel>.apiRequest(productsPath(offset, limit: limit)) { response in
            switch response {
            case .success(let data):
                guard let decodedData: [Product] = data.decode() else { return }
                return result(decodedData)
            case .failure:
                return result([])
            }
        }
    }
}
