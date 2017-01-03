//
//  PulmonisPeakFlow.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 02/01/2017.
//  Copyright © 2017 Manivannan Solan. All rights reserved.
//

import XCTest

class PulmonisPeakFlow: XCTestCase {
        
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
    
    func testCriticalSegueFromPeakFlowValue() {
        
        XCUIDevice.shared().orientation = .portrait
        
        let app = XCUIApplication()
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Peak Flow"].tap()
        app.buttons["Test Button"].tap()
        
        let test100Button = app.buttons["Test 100"]
        test100Button.tap()
        test100Button.tap()
        test100Button.tap()
        app.navigationBars["Pulmonis.PlotBreathGraphView"].buttons["Continue"].tap()
        
        let nextButton = app.buttons["Next"]
        nextButton.tap()
        nextButton.tap()
        
    }
    
    func testWorseSegueFromPeakFlowValue() {
        
        let app = XCUIApplication()
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Peak Flow"].tap()
        app.buttons["Test Button"].tap()
        
        let test300Button = app.buttons["Test 300"]
        test300Button.tap()
        test300Button.tap()
        test300Button.tap()
        app.navigationBars["Pulmonis.PlotBreathGraphView"].buttons["Continue"].tap()
        app.buttons["Next"].tap()
        app.buttons["Button"].tap()
        app.buttons["Taken"].tap()
        app.buttons["Talk to your GP"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Your treatment may need to be reviewed."].swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        app.navigationBars["Pending Tasks"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
    }
    
    func testWellSegueFromPeakFlowValue() {
        
        let app = XCUIApplication()
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Peak Flow"].tap()
        app.buttons["Test Button"].tap()
        
        let test600Button = app.buttons["Test 600"]
        test600Button.tap()
        test600Button.tap()
        test600Button.tap()
        app.navigationBars["Pulmonis.PlotBreathGraphView"].buttons["Continue"].tap()
        
        let nextButton = app.buttons["Next"]
        nextButton.tap()
        nextButton.tap()
        
    }
    
    
}
