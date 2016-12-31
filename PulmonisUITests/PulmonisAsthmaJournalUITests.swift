//
//  PulmonisAsthmaJournalUITests.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 29/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import XCTest

class PulmonisAsthmaJournalUITests: XCTestCase {
        
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
    
    func testSupportRecord() {
        
        let app = XCUIApplication()
        app.navigationBars["Pulmonis.View"].buttons["⚙"].tap()
        app.tables.staticTexts["Asthma Journal"].tap()
        let cellCount = app.tables.cells.count + 1
        app.navigationBars["Asthma Journal"].buttons["Settings"].tap()
        app.navigationBars["Settings"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Support"].tap()
        let textField = app.otherElements.containing(.navigationBar, identifier:"Pulmonis.SupportView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .textField).element
        
        textField.tap()
        textField.typeText("1")
        let nextButton = app.buttons["Next"]
        nextButton.tap()
        app.alerts["Please confirm inhaler usage:"].buttons["Yes"].tap()
        nextButton.tap()
        app.navigationBars["Pulmonis.View"].buttons["⚙"].tap()
        app.tables.staticTexts["Asthma Journal"].tap()
        XCTAssertEqual(cellCount, app.tables.cells.count, "Incorrect number of items in asthma journal")
    }
    
}
