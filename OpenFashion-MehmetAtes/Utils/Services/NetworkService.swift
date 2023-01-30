//
//  NetworkService.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 30.07.2022.
//

import Alamofire
import Foundation

class NetworkService<T: RequestModel> {
    
    static func apiRequest(
        _ path: String, method: HTTPMethod? = .get,
        parameters: T? = nil,
        headers: HTTPHeaders? = nil,
        interceptor: RequestInterceptor? = nil,
        requestModifier: Session.RequestModifier? = nil,
        result: @escaping(Result<Data, AFError>) -> Void
    ) {
        AF.request(
            path,
            method: method ?? .get,
            parameters: parameters,
            encoder: JSONParameterEncoder.default,
            headers: headers,
            interceptor: interceptor,
            requestModifier: requestModifier
        ).response { data in
            switch data.result {
            case .success(let data):
                guard let data = data else { return }
                return result(.success(data))
            case .failure(let err):
                return result(.failure(err))
            }
        }
    }
}
