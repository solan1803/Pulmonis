//
//  PulmonisUITests.swift
//  PulmonisUITests
//
//  Created by Manivannan Solan on 14/10/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import XCTest

class PulmonisUITests: XCTestCase {
        
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
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testMedicineUI() {
        
        let app = XCUIApplication()
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Support"].tap()
        // Need to be able to write tests for core data.
//        app.buttons["Next"].tap()
        
    }
    
    func testPendingTasksTable() {
        
        let app = XCUIApplication()
        let tasksButton = app.buttons["tasks"]
        tasksButton.tap()
        app.navigationBars["Pending Tasks"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Support"].tap()
        app.buttons["Next"].tap()
        app.buttons["I do not have this"].tap()
        app.navigationBars["Medicine"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.navigationBars["Pulmonis.SupportView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.navigationBars["UIView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        tasksButton.tap()
        
    }
    
    func testPeakFlow() {
        
        let app = XCUIApplication()
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Peak Flow"].tap()
        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.PeakFlowView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        app.images["Shiny Blue"].tap()
        
    }
    
}
