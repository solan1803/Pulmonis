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
        let textField = app.otherElements.containing(.navigationBar, identifier:"Pulmonis.SupportView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("3")
        app.buttons["Next"].tap()
        app.alerts["Please confirm inhaler usage:"].buttons["Yes"].tap()
        app.buttons["I do not have this"].tap()
        
    }
    
    func testWellSegueFromSupport() {
        
        let app = XCUIApplication()
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Support"].tap()
        
        let textField = app.otherElements.containing(.navigationBar, identifier:"Pulmonis.SupportView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("1")
        app.buttons["Next"].tap()
        
    }
    
    func testCriticalSegueFromSupport() {
        let app = XCUIApplication()
        app.buttons["ACTION PLAN"].tap()
        app.buttons["Support"].tap()
        
        let textField = app.otherElements.containing(.navigationBar, identifier:"Pulmonis.SupportView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("6")
        app.buttons["Next"].tap()
    }
    
//    func testPeakFlow() {
//        
//        let app = XCUIApplication()
//        app.buttons["ACTION PLAN"].tap()
//        app.buttons["Peak Flow"].tap()
//        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.PeakFlowView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
//        app.images["Shiny Blue"].tap()
//        
//    }
    
    //test transitions in doctor's input section
//    func testDoctorInputTransitions() {
//        
//        
//        let app = XCUIApplication()
//        app.navigationBars["Pulmonis.View"].buttons["⚙"].tap()
//        app.buttons["Doctor"].tap()
//        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.Green1View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
//        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.Green2View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
//        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.Green3View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
//        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.Green4View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
//        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.Green5View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
//        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.Green6View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
//        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.Yellow1View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
//        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.Yellow2View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
//        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.Yellow3View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
//        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.Yellow4View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
//        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.Yellow5View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
//        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.Yellow6View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
//        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.Yellow7View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
//        app.otherElements.containing(.navigationBar, identifier:"Pulmonis.Red1View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
//        app.navigationBars["Pulmonis.Red2View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
//        app.navigationBars["Pulmonis.Red1View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
//        app.navigationBars["Pulmonis.Yellow7View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
//        app.navigationBars["Pulmonis.Yellow6View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
//        app.navigationBars["Pulmonis.Yellow5View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
//        app.navigationBars["Pulmonis.Yellow4View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
//        app.navigationBars["Pulmonis.Yellow3View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
//        app.navigationBars["Pulmonis.Yellow2View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
//        app.navigationBars["Pulmonis.Yellow1View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
//        app.navigationBars["Pulmonis.Green6View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
//        app.navigationBars["Pulmonis.Green5View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
//        app.navigationBars["Pulmonis.Green4View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
//        app.navigationBars["Pulmonis.Green3View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
//        app.navigationBars["Pulmonis.Green2View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
//
//    }
    
}
