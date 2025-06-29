//
//  Xiteb_mCommerceUITests.swift
//  Xiteb-mCommerceUITests
//
//  Created by Macbook Pro on 27/06/25.
//

import XCTest

final class Xiteb_mCommerceUITests: XCTestCase {

    let app = XCUIApplication()

        override func setUpWithError() throws {
            continueAfterFailure = false
            app.launchArguments.append("--uitesting")
            app.launch()
        }

        func testAddToCartAndNavigateToCartView() {
            // Assuming you're on ProductListView by default and render products select first and add to cart and check the cart page

            let firstProduct = app.scrollViews.otherElements.buttons.firstMatch
            XCTAssertTrue(firstProduct.waitForExistence(timeout: 5))
            firstProduct.tap()

            let addToCartButton = app.buttons["AddToCartButton"]
            XCTAssertTrue(addToCartButton.exists)
            addToCartButton.tap()
            
            let alertGotoButton = app.buttons["Go To Cart"]
            alertGotoButton.tap()
            
            let cartTitle = app.navigationBars["Cart"]
            XCTAssertTrue(cartTitle.waitForExistence(timeout: 2))
        }
}
