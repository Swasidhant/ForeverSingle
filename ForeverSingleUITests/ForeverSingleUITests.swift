//
//  ForeverSingleUITests.swift
//  ForeverSingleUITests
//
//  Created by Swasidhant Chowdhury on 10/02/18.
//  Copyright © 2018 Swasidhant Chowdhury. All rights reserved.
//

import XCTest

class ForeverSingleUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        XCTAssertNotNil(tablesQuery.cells["Advantages"])
        let element = app.navigationBars.otherElements["Forever Single"]
        XCTAssertNotNil(element, "Nav bar text not present")
    }
    
    func testAlert() {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        let predictionElement = tablesQuery.cells.staticTexts["Prediction"].tap()
        let alerts = app.alerts
        XCTAssertTrue(alerts.element.exists, "alert not coming")
    }
    
    func testAlertWithDelay() {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        let predictionElement = tablesQuery.cells.staticTexts["Weather Condition"].tap()
        let alerts = app.alerts
        XCTAssertTrue(alerts.element.exists, "alert not coming")
    }
    
    func testAlertWithDelayHandled() {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        let predictionElement = tablesQuery.cells.staticTexts["Weather Condition"].tap()
        let alerts = app.alerts
        let expectation = XCTKVOExpectation.init(keyPath: "exists", object: alerts.element, expectedValue: true)
        let result = XCTWaiter.wait(for: [expectation], timeout: 3.0)
        XCTAssertEqual(result, .completed, "alert not coming for weather prediction")
    }
    
    func testAlertWithDelayHandledDemo() {
        let app = XCUIApplication()
        let table = app.tables.element
        let cell = table.cells.element(boundBy: 1)
        let alerts = app.alerts
        let expectation = XCTKVOExpectation.init(keyPath: "exists", object: alerts.element, expectedValue: true)
        let result = XCTWaiter.wait(for: [expectation], timeout: 3.0)
    }
    
    func testDemo () {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        let element = tablesQuery/*@START_MENU_TOKEN@*/.cells["Advantages"].staticTexts["Advantages"]/*[[".cells[\"Advantages\"].staticTexts[\"Advantages\"]",".staticTexts[\"Advantages\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        
        XCTAssertNotNil(element, "advantages label doesnot exist")
        
//        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Only you eat your own ice-cream"]/*[[".cells.staticTexts[\"Only you eat your own ice-cream\"]",".staticTexts[\"Only you eat your own ice-cream\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.navigationBars["Advantages"].buttons["Forever Single"].tap()
//        tablesQuery.cells["Prediction"].tap()
//        app.alerts["Prediction"].buttons["Ok"].tap()
        
    }
    
}
