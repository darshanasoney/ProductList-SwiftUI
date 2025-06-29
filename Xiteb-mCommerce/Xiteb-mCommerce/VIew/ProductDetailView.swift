//
//  ProductDetailView.swift
//  Xiteb-mCommerce
//
//  Created by Macbook Pro on 28/06/25.
//


import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject var cartManager: CartManager
    @Binding var path: NavigationPath
    @State private var showAddedAlert = false

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    AsyncImage(url: URL(string: product.image)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(height: 240)
                                .frame(maxWidth: .infinity)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 240)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(12)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 240)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    Text(product.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Category: \(product.category.capitalized)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("Price: ₹\(product.price, specifier: "%.2f")")
                        .font(.title2)
                        .foregroundColor(.green)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(product.rating.rate, specifier: "%.1f")")
                        Text("(\(product.rating.count) reviews)")
                            .foregroundColor(.secondary)
                    }
                    .font(.subheadline)
                    
                    Text(product.description)
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding(.top)
                    
                    Spacer()
                }
                .padding()
                .background(Color(.systemBackground).ignoresSafeArea(edges: .bottom))
                .alert(isPresented: $showAddedAlert) {
                    Alert(
                        title: Text("Added to Cart"),
                        message: Text("\(product.title) has been added."),
                        primaryButton: .default(Text("Go To Cart"), action: {
                            path.append("cart")
                        }), secondaryButton: .cancel()
                    )
                }
            }
            Spacer()
            Button(action: {
                cartManager.addToCart(product: product)
                showAddedAlert = true
            }) {
                Text("Add to Cart")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .accessibilityIdentifier("AddToCartButton")
            }
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
