//
//  Xiteb_mCommerceApp.swift
//  Xiteb-mCommerce
//
//  Created by Macbook Pro on 27/06/25.
//

import SwiftUI

@main
struct Xiteb_mCommerceApp: App {
    
    @StateObject private var cartManager = CartManager()
    
    var body: some Scene {
        WindowGroup {
            //MARK: Use Mock Product Service in case of API not working
            ProductListView(viewModel: ProductListViewModel(service: MockProductService())).environmentObject(cartManager)
            
//            ProductListView(viewModel: ProductListViewModel(service: ProductService())).environmentObject(cartManager)
        }
    }
}
