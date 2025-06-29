//
//  CartManager.swift
//  Xiteb-mCommerce
//
//  Created by Macbook Pro on 29/06/25.
//

import SwiftUI

class CartManager: ObservableObject {
    
    private let userDefaultsKey = "SavedCartItems"
    @Published var items: [CartItem] = [] {
        didSet {
            saveToUserDefaults()
        }
    }

    init() {
        loadFromUserDefaults()
    }

    private func saveToUserDefaults() {
        do {
            let data = try JSONEncoder().encode(items)
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        } catch {
            print("Failed encoding: \(error)")
        }
    }

    private func loadFromUserDefaults() {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else { return }
        do {
            items = try JSONDecoder().decode([CartItem].self, from: data)
        } catch {
            print("Failed decoding: \(error)")
            items = []
        }
    }
    
    func addToCart(product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(product: product, quantity: 1))
        }
    }

    func removeFromCart(product: Product) {
        items.removeAll { $0.product.id == product.id }
    }

    func totalQuantity() -> Int {
        items.reduce(0) { $0 + $1.quantity }
    }

    func totalPrice() -> Double {
        items.reduce(0) { $0 + (Double($1.quantity) * $1.product.price) }
    }
    
    func increaseQuantity(for product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        }
    }

    func decreaseQuantity(for product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity -= 1
            if items[index].quantity <= 0 {
                removeFromCart(product: product)
            }
        }
    }

    func clearCart() {
        items.removeAll()
    }
}
