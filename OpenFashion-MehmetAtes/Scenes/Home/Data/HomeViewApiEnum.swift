//
//  HomeViewApiEnum.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 2.02.2023.
//

import Foundation

enum HomeViewApiEnum {
    static func productPath(_ offset: Int, limit: Int) -> String { "https://api.escuelajs.co/api/v1/products/?offset=\(offset)&limit=\(limit)" }
}
