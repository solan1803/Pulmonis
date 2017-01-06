//
//  PulmonisSupportUITests.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 06/01/2017.
//  Copyright © 2017 Manivannan Solan. All rights reserved.
//

import XCTest

class PulmonisSupportUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        clearSupportRecords()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        clearSupportRecords()
    }
    
    func clearSupportRecords() {
        let app = XCUIApplication()
        app.buttons["LEARN"].tap()
        app.tables.staticTexts["As a doctor, learn how to use the app to help improve your patients asthma."].tap()
        app.buttons["Delete All Support Records"].tap()
        app.navigationBars["Pulmonis.PushNotificationsView"].buttons["LEARN"].tap()
        app.navigationBars["LEARN"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
    }
    
    func testNoButton() {
        
        let app = XCUIApplication()
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Support"].tap()
        app.buttons["No"].tap()
        
        
    }
    
    func testMainSegue() {
        let app = XCUIApplication()
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Support"].tap()
        app.buttons["Yes"].tap()
        app.alerts["Please confirm reliever inhaler usage:"].buttons["Yes"].tap()
    }
    
    func testWorseSegueNotTaken() {
        
        
        let app = XCUIApplication()
        app.buttons["No current pending tasks"].tap()
        let cellCount = app.tables.cells.count + 2
        

        app.navigationBars["Pending Tasks"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.buttons["LEARN"].tap()
        XCUIApplication().tables.staticTexts["As a doctor, learn how to use the app to help improve your patients asthma."].tap()
        
        
        app.buttons["Set Worse Records"].tap()
        
        app.navigationBars["Pulmonis.PushNotificationsView"].buttons["LEARN"].tap()
        app.navigationBars["LEARN"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Support"].tap()
        app.buttons["Yes"].tap()
        app.alerts["Please confirm reliever inhaler usage:"].buttons["Yes"].tap()
        app.buttons["Button"].tap()
        app.buttons["I do not have this"].tap()
        
        // at this point should be at main page.
        app.buttons["Talk to your GP"].tap()
        XCTAssertEqual(cellCount, app.tables.cells.count, "Number of pending tasks incorrect!")
        let tablesQuery = app.tables
        let talkToYourGpStaticText = tablesQuery.staticTexts["Talk to your GP"]
        talkToYourGpStaticText.swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        tablesQuery.staticTexts["No record of dosage, contact GP."].swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        app.navigationBars["Pending Tasks"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
    }
    
    func testWorseSegueTaken() {
        
        
        let app = XCUIApplication()
        app.buttons["No current pending tasks"].tap()
        let cellCount = app.tables.cells.count + 1
        
        
        app.navigationBars["Pending Tasks"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.buttons["LEARN"].tap()
        XCUIApplication().tables.staticTexts["As a doctor, learn how to use the app to help improve your patients asthma."].tap()
        
        
        app.buttons["Set Worse Records"].tap()
        
        app.navigationBars["Pulmonis.PushNotificationsView"].buttons["LEARN"].tap()
        app.navigationBars["LEARN"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Support"].tap()
        app.buttons["Yes"].tap()
        app.alerts["Please confirm reliever inhaler usage:"].buttons["Yes"].tap()
        app.buttons["Button"].tap()
        app.buttons["Taken"].tap()
        
        // at this point should be at main page.
        app.buttons["Talk to your GP"].tap()
        XCTAssertEqual(cellCount, app.tables.cells.count, "Number of pending tasks incorrect!")
        let tablesQuery = app.tables
        let talkToYourGpStaticText = tablesQuery.staticTexts["Talk to your GP"]
        talkToYourGpStaticText.swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        app.navigationBars["Pending Tasks"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
    }
    
}
