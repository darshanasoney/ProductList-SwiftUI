//
//  ProductListView.swift
//  Xiteb-mCommerce
//
//  Created by Macbook Pro on 27/06/25.
//


import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel: ProductListViewModel
    @State private var path = NavigationPath()
    @EnvironmentObject var cartManager: CartManager


    let columns = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]
    
    var body: some View {
        NavigationStack(path: $path)  {
            ScrollView {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                } else {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.products) { product in
                            NavigationLink(value: product) {
                                ProductGridItemView(product: product) {
                                    path.append(product)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Products")
            .navigationBarTitleDisplayMode(.large)

            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(value: "cart") {
                        HStack {
                            Image(systemName: "cart")
                            if cartManager.totalQuantity() > 0 {
                                Text("\(cartManager.totalQuantity())")
                                    .frame(alignment: Alignment.center)
                                    .font(.caption2)
                                    .foregroundColor(.white)
                                    .padding(4)
                                    .background(Color.red)
                                    .clipShape(Circle())
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Product.self) { product in
                ProductDetailView(product: product, path: $path)
            }
            .navigationDestination(for: String.self) { screen in
                if screen == "cart" {
                    CartView()
                }
            }
        }
        .onAppear {
            viewModel.loadProducts()
        }
    }
}
