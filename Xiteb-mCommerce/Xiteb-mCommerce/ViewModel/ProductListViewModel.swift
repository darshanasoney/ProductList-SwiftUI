//
//  ProductListViewModel.swift
//  Xiteb-mCommerce
//
//  Created by Macbook Pro on 27/06/25.
//

import Foundation

@MainActor
class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service: ProductServiceProtocol

    init(service: ProductServiceProtocol) {
        self.service = service
    }

    func loadProducts() {
        Task {
            isLoading = true
            do {
                let result = try await service.fetchProducts()
                self.products = result
            } catch {
                self.errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}
