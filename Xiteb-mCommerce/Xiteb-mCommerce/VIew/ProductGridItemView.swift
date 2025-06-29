//
//  ProductGridItemView.swift
//  Xiteb-mCommerce
//
//  Created by Macbook Pro on 28/06/25.
//

import SwiftUI

struct ProductGridItemView: View {
    let product: Product
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: product.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(height: 120)
                        .frame(maxWidth: .infinity)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 120)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .cornerRadius(8)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }

            Text(product.title)
                .font(.headline)
                .lineLimit(2)

            Text("₹\(product.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.green)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
        .onTapGesture {
            onTap()
        }
    }
}
