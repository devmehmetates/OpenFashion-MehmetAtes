//
//  HomeViewModel.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 1.08.2022.
//

protocol HomeViewModel { }

// MARK: - Network
extension HomeViewModel {
    func getProducts(result: @escaping ([Product]) -> Void) {
        NetworkService<DummyModel>.apiRequest("https://api.escuelajs.co/api/v1/products/?offset=10&limit=20") { response in
            switch response {
            case .success(let data):
                guard let decodedData: [Product] = data.decode() else { return }
                return result(decodedData)
            case .failure(let err):
                print(err)
                return result([])
            }
        }
    }
}
