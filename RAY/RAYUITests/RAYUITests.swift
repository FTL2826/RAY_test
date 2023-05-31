//
//  RAYUITests.swift
//  RAYUITests
//
//  Created by Alex Kharin on 6/1/23.
//

import XCTest

final class RAYUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        let textField = app.textFields["Query"]
        XCTAssertTrue(textField.exists)
        
        textField.tap()
        textField.typeText("One")
        
        let favoriteButton = app.buttons["Add to favorite"]
        XCTAssertTrue(favoriteButton.exists)
        XCTAssertFalse(favoriteButton.isEnabled)
        
        let submintButton = app.buttons["Submit"]
        XCTAssertTrue(submintButton.exists)
        let alert = app.alerts["Error ocurred!"]
        
        submintButton.tap()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(favoriteButton.isEnabled || alert.exists)
        }
        
        
        
                
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
