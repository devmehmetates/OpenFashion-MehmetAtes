//
//  ProductModel.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 1.08.2022.
//

struct Product: Codable {
    var id: Int?
    var title: String?
    var price: Int?
    var description: String?
    var category: ProductCategory?
    var images: [String]?
}
