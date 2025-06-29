//
//  MockProductService.swift
//  Xiteb-mCommerce
//
//  Created by Macbook Pro on 28/06/25.
//

import SwiftUI


class MockProductService: ProductServiceProtocol {
    func fetchProducts() async throws -> [Product] {
        return [
            Product(
                id: 1,
                title: "iPhone 15 Pro",
                price: 1299.00,
                description: "Apple's latest flagship with A17 chip, titanium body, and Dynamic Island.",
                category: "Apple iPhones",
                image: "https://via.placeholder.com/200x150.png?text=iPhone",
                rating: Rating(rate: 3.5, count: 12)
            ),
            Product(
                id: 2,
                title: "MacBook Air M2",
                price: 1099.00,
                description: "Super-thin, super-fast laptop powered by Apple silicon.",
                category: "Apple Mac",
                image: "https://via.placeholder.com/200x150.png?text=MacBook",
                rating: Rating(rate: 4, count: 112)
            ),
            Product(
                id: 3,
                title: "Apple Watch Ultra",
                price: 1200,
                description: "The most rugged and capable Apple Watch ever.",
                category: "Apple Watches",
                image: "https://via.placeholder.com/200x150.png?text=Watch",
                rating: Rating(rate: 5, count: 100)
            ),
            Product(
                id: 4,
                title: "Apple Watch Ultra",
                price: 1200,
                description: "The most rugged and capable Apple Watch ever.",
                category: "Apple Watches",
                image: "https://via.placeholder.com/200x150.png?text=Watch",
                rating: Rating(rate: 5, count: 100)
            ),
            Product(
                id: 5,
                title: "Apple Watch Ultra",
                price: 1200,
                description: "The most rugged and capable Apple Watch ever.",
                category: "Apple Watches",
                image: "https://via.placeholder.com/200x150.png?text=Watch",
                rating: Rating(rate: 5, count: 100)
            ),
            Product(
                id: 6,
                title: "Apple Watch Ultra",
                price: 1200,
                description: "The most rugged and capable Apple Watch ever.",
                category: "Apple Watches",
                image: "https://via.placeholder.com/200x150.png?text=Watch",
                rating: Rating(rate: 5, count: 100)
            ),
            Product(
                id: 7,
                title: "Apple Watch Ultra",
                price: 1200,
                description: "The most rugged and capable Apple Watch ever.",
                category: "Apple Watches",
                image: "https://via.placeholder.com/200x150.png?text=Watch",
                rating: Rating(rate: 5, count: 100)
            ),
            Product(
                id: 8,
                title: "Apple Watch Ultra",
                price: 1200,
                description: "The most rugged and capable Apple Watch ever.",
                category: "Apple Watches",
                image: "https://via.placeholder.com/200x150.png?text=Watch",
                rating: Rating(rate: 5, count: 100)
            ),
        ]
    }
}
