//
//  CartView.swift
//  Xiteb-mCommerce
//
//  Created by Macbook Pro on 29/06/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        VStack {
            if cartManager.items.isEmpty {
                VStack(spacing: 20) {
                    Image(systemName: "cart.fill.badge.minus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray.opacity(0.6))

                    Text("Your cart is empty")
                        .font(.title2)
                        .foregroundColor(.secondary)

                    Text("Add some products to get started!")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                Spacer()
            } else {
                List {
                    Section(header: Text("Cart Items")) {
                        ForEach(cartManager.items) { item in
                            HStack(alignment: .top, spacing: 12) {
                                AsyncImage(url: URL(string: item.product.image)) { phase in
                                    if let image = phase.image?.resizable() {
                                        image
                                            .frame(width: 60, height: 60)
                                            .cornerRadius(8)
                                            .scaledToFit()
                                    } else {
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 60, height: 60)
                                            .cornerRadius(8)
                                    }
                                }

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(item.product.title)
                                        .font(.headline)
                                        .lineLimit(2)

                                    Text("₹\(item.product.price, specifier: "%.2f")")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)

                                    Text("Subtotal: ₹\(item.product.price * Double(item.quantity), specifier: "%.2f")")
                                        .font(.subheadline)
                                        .foregroundColor(.green)

                                    HStack {
                                        Button(action: {
                                            cartManager.decreaseQuantity(for: item.product)
                                        }) {
                                            Image(systemName: "minus.circle")
                                        }

                                        Text("\(item.quantity)")
                                            .padding(.horizontal, 8)

                                        Button(action: {
                                            cartManager.increaseQuantity(for: item.product)
                                        }) {
                                            Image(systemName: "plus.circle")
                                        }
                                    }
                                    .buttonStyle(.borderless)
                                    .font(.system(size: 20))
                                    .padding(.top, 4)
                                }

                                Spacer()

                                Button {
                                    cartManager.removeFromCart(product: item.product)
                                } label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 8)
                        }
                    }

                    Section {
                        HStack {
                            Text("Total")
                                .font(.headline)
                            Spacer()
                            Text("₹\(cartManager.totalPrice(), specifier: "%.2f")")
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())

                Button(role: .destructive) {
                    cartManager.clearCart()
                } label: {
                    Text("Clear Cart")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.bottom, 10)
            }
        }
        .navigationTitle("Cart")
    }
}


