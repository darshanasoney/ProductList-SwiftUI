//
//  Xiteb_mCommerceTests.swift
//  Xiteb-mCommerceTests
//
//  Created by Macbook Pro on 27/06/25.
//

import XCTest
@testable import Xiteb_mCommerce

final class Xiteb_mCommerceTests: XCTestCase {
        
        var cartManager: CartManager!
        var testProduct: Product!

        override func setUp() {
            super.setUp()
            cartManager = CartManager()
            cartManager.clearCart()
            
            testProduct = Product(
                id: 1,
                title: "Test Product",
                price: 100.0, description: "A test item",
                category: "test",
                image: "",
                rating: Rating(rate: 4.5, count: 10)
            )
        }

        override func tearDown() {
            cartManager = nil
            testProduct = nil
            super.tearDown()
        }

        func testAddToCart_NewItem() {
            cartManager.addToCart(product: testProduct)
            XCTAssertEqual(cartManager.items.count, 1)
            XCTAssertEqual(cartManager.items.first?.quantity, 1)
        }

        func testAddToCart_ExistingItem() {
            cartManager.addToCart(product: testProduct)
            cartManager.addToCart(product: testProduct)
            XCTAssertEqual(cartManager.items.count, 1)
            XCTAssertEqual(cartManager.items.first?.quantity, 2)
        }

        func testRemoveFromCart() {
            cartManager.addToCart(product: testProduct)
            cartManager.removeFromCart(product: testProduct)
            XCTAssertTrue(cartManager.items.isEmpty)
        }

        func testIncreaseQuantity() {
            cartManager.addToCart(product: testProduct)
            cartManager.increaseQuantity(for: testProduct)
            XCTAssertEqual(cartManager.items.first?.quantity, 2)
        }

        func testDecreaseQuantity_AboveZero() {
            cartManager.addToCart(product: testProduct)
            cartManager.addToCart(product: testProduct)
            cartManager.decreaseQuantity(for: testProduct)
            XCTAssertEqual(cartManager.items.first?.quantity, 1)
        }

        func testDecreaseQuantity_ToZeroRemovesItem() {
            cartManager.addToCart(product: testProduct)
            cartManager.decreaseQuantity(for: testProduct)
            XCTAssertTrue(cartManager.items.isEmpty)
        }

        func testClearCart() {
            cartManager.addToCart(product: testProduct)
            cartManager.clearCart()
            XCTAssertTrue(cartManager.items.isEmpty)
        }

        func testTotalQuantityAndPrice() {
            cartManager.addToCart(product: testProduct)
            cartManager.addToCart(product: testProduct)
            XCTAssertEqual(cartManager.totalQuantity(), 2)
            XCTAssertEqual(cartManager.totalPrice(), 200.0)
        }

        func testPersistence_SaveAndLoad() {
            cartManager.addToCart(product: testProduct)

            let newCartManager = CartManager()
            XCTAssertEqual(newCartManager.items.count, 1)
            XCTAssertEqual(newCartManager.items.first?.quantity, 1)
        }

}
