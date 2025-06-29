//
//  CartItem.swift
//  Xiteb-mCommerce
//
//  Created by Macbook Pro on 29/06/25.
//

import SwiftUI

struct CartItem: Identifiable, Hashable, Codable {
    let id: UUID
    let product: Product
    var quantity: Int

    init(id: UUID = UUID(), product: Product, quantity: Int) {
        self.id = id
        self.product = product
        self.quantity = quantity
    }
}
