//
//  NetworkManager.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 2.02.2023.
//

import Foundation

public final class NetworkManager {
    static let shared = NetworkManager()
    
    func apiRequest(_ url: String, headers: [String: String]? = nil, qos: DispatchQoS.QoSClass = .default, completion: @escaping (Result<Data, RequestErrors>) -> Void) {
        guard let requestURL = URL(string: url) else { return completion(.failure(.wrongURL)) }
        let request = prepareRequest(with: requestURL)

        DispatchQueue.global(qos: qos).async {
            URLSession.shared.dataTask(with: request) { responseData, _, error in
                if let error { return completion(.failure(.unload(error: error.localizedDescription))) }
                guard let responseData else { return completion(.failure(.noData)) }
                return completion(.success(responseData))
            }.resume()
        }
    }
    
    private func prepareRequest(with url: URL, use headers: [String: String]? = nil) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        if let headers {
            for header in headers {
                urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        return urlRequest
    }
}

enum RequestErrors: Error {
    case wrongURL
    case unload(error: String)
    case noData
    case decodeError
}
