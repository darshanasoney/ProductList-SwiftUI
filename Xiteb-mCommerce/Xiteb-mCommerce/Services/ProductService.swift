//
//  ProductService.swift
//  Xiteb-mCommerce
//
//  Created by Macbook Pro on 27/06/25.
//


import Foundation

enum ProductServiceError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case networkError(String)
    case decodingFailed(String)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL for the API endpoint is invalid."
        case .invalidResponse:
            return "Received an unexpected response from the server."
        case .networkError(let message):
            return "Network error occurred: \(message)"
        case .decodingFailed(let message):
            return "Failed to decode the data: \(message)"
        }
    }
}


class ProductService: ProductServiceProtocol {
    
    private let baseURLString = "https://fakestoreapi.com/products"
    
    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: baseURLString) else {
            throw ProductServiceError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw ProductServiceError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode([Product].self, from: data)
        } catch {
            throw ProductServiceError.decodingFailed(error.localizedDescription)
        }
    }
}
