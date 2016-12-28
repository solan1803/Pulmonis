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
    
    func testPendingTasksTable() {
        
        let app = XCUIApplication()
        let tasksButton = app.buttons["tasks"]
        tasksButton.tap()
        let cellCount = app.tables.cells.count + 2
        app.navigationBars["Pending Tasks"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Support"].tap()
        
        let textField = app.otherElements.containing(.navigationBar, identifier:"Pulmonis.SupportView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .textField).element
        
        textField.tap()
        textField.typeText("3")
        app.buttons["Next"].tap()
        app.alerts["Please confirm inhaler usage:"].buttons["Yes"].tap()
        
        app.buttons["I do not have this"].tap()
        tasksButton.tap()
        XCTAssertEqual(cellCount, app.tables.cells.count, "Number of pending tasks incorrect!")
    }
    
    func testWellSegueFromSupport() {
        
        let app = XCUIApplication()
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Support"].tap()
        
        let textField = app.otherElements.containing(.navigationBar, identifier:"Pulmonis.SupportView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("1")
        app.buttons["Next"].tap()
        
    }
    
    func testCriticalSegueFromSupport() {
        let app = XCUIApplication()
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Support"].tap()
        
        let textField = app.otherElements.containing(.navigationBar, identifier:"Pulmonis.SupportView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("6")
        app.buttons["Next"].tap()
    }
    
    func testEmergencyActionLoading() {
        
        let app = XCUIApplication()
        app.buttons["EMERGENCY ACTION"].tap()
        
        let nextButton = app.buttons[" Next "]
        nextButton.tap()
        nextButton.tap()
        
    }
    
    func testLearnTableLoading() {
        XCUIApplication().buttons["LEARN"].tap()
        
    }
}
