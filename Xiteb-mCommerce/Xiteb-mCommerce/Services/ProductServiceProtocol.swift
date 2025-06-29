//
//  ProductServiceProtocol.swift
//  Xiteb-mCommerce
//
//  Created by Macbook Pro on 27/06/25.
//


protocol ProductServiceProtocol {
    func fetchProducts() async throws -> [Product]
}
