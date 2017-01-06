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
    
    func testEmergencyActionLoading() {
        
        let app = XCUIApplication()
        app.buttons["EMERGENCY ACTION"].tap()
        
        let nextButton = app.buttons[" Next "]
        nextButton.tap()
        nextButton.tap()
        
    }
  
    func testPollenForecast() {
        
        let app = XCUIApplication()
        app.buttons["MAP"].tap()
        app.navigationBars["Pulmonis.PollenChartView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
    }
    
    func testLearnTableLoading() {
        XCUIApplication().buttons["LEARN"].tap()
        
    }
    
    func testStatsLoading() {
        XCUIDevice.shared().orientation = .portrait
        
        let app = XCUIApplication()
        app.buttons["STATS"].tap()
        app.navigationBars["Statistics Selection"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
    }
    
    func testRemindersSettings() {
        
        let app = XCUIApplication()
        app.navigationBars["Pulmonis.View"].buttons["⚙"].tap()
        
        let tablesQuery = app.tables
        let remindersStaticText = tablesQuery.staticTexts["Reminders"]
        remindersStaticText.tap()
        
        let morningReminderNoRecordInDoctorSInputSwitch = tablesQuery.switches["Morning reminder, No record in doctor's input."]
        morningReminderNoRecordInDoctorSInputSwitch.tap()
        
        let eveningReminderNoRecordInDoctorSInputSwitch = tablesQuery.switches["Evening reminder, No record in doctor's input."]
        eveningReminderNoRecordInDoctorSInputSwitch.tap()
        
        let settingsButton = app.navigationBars["Reminders"].buttons["Settings"]
        settingsButton.tap()
        remindersStaticText.tap()
        morningReminderNoRecordInDoctorSInputSwitch.tap()
        eveningReminderNoRecordInDoctorSInputSwitch.tap()
        settingsButton.tap()
        app.navigationBars["Settings"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        
    }
}
