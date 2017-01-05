//
//  PulmonisDoctorInputUITest.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 27/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import XCTest

class PulmonisDoctorInputUITest: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        let app = XCUIApplication()
        app.navigationBars["Pulmonis.View"].buttons["⚙"].tap()
        app.tables.staticTexts["Doctor's Input"].tap()
        
        
        
        let element12 = app.otherElements.containing(.navigationBar, identifier:"Page 1 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let textField = element12.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        textField.typeText("brown")
        element12.swipeLeft()
        
        let element = app.otherElements.containing(.navigationBar, identifier:"Page 2 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("2")
        element.swipeLeft()
        
        let element2 = app.otherElements.containing(.navigationBar, identifier:"Page 3 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element2.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("3")
        element2.swipeLeft()
        
        
        let element13 = app.otherElements.containing(.navigationBar, identifier:"Page 4 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let textField2 = element13.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        textField2.typeText("orange")
        element13.swipeLeft()
        
        let element3 = app.otherElements.containing(.navigationBar, identifier:"Page 5 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element3.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("2")
        element3.swipeLeft()
        app.otherElements.containing(.navigationBar, identifier:"Page 6 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        
        let element4 = app.otherElements.containing(.navigationBar, identifier:"Page 7 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element4.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("4")
        element4.swipeLeft()
        
        let element5 = app.otherElements.containing(.navigationBar, identifier:"Page 8 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element5.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("3")
        element5.swipeLeft()
        
        let element6 = app.otherElements.containing(.navigationBar, identifier:"Page 9 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element6.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("4")
        element6.swipeLeft()
        
        let element7 = app.otherElements.containing(.navigationBar, identifier:"Page 10 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element7.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("5")
        element7.swipeLeft()
        
        let element8 = app.otherElements.containing(.navigationBar, identifier:"Page 11 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element8.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("2")
        element8.swipeLeft()
        
        let element9 = app.otherElements.containing(.navigationBar, identifier:"Page 12 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element9.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("2")
        element9.swipeLeft()
        
        let element10 = app.otherElements.containing(.navigationBar, identifier:"Page 13 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element10.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("3")
        element10.swipeLeft()
        
        let element11 = app.otherElements.containing(.navigationBar, identifier:"Page 14 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element11.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("8")
        element11.swipeLeft()
        app.otherElements.containing(.navigationBar, identifier:"Page 15 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("9")
        app.buttons["Save"].tap()
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        let app = XCUIApplication()
        app.navigationBars["Pulmonis.View"].buttons["⚙"].tap()
        app.tables.staticTexts["Doctor's Input"].tap()
        
        let deleteKey = app.keys["delete"]
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        
        app.otherElements.containing(.navigationBar, identifier:"Page 1 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        
        let deleteKey2 = app.keys["Delete"]
        deleteKey2.tap()
        
        app.otherElements.containing(.navigationBar, identifier:"Page 2 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        deleteKey2.tap()
        
        app.otherElements.containing(.navigationBar, identifier:"Page 3 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        app.otherElements.containing(.navigationBar, identifier:"Page 4 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        deleteKey2.tap()
        
        app.otherElements.containing(.navigationBar, identifier:"Page 5 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        app.otherElements.containing(.navigationBar, identifier:"Page 6 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        deleteKey2.tap()
        
        app.otherElements.containing(.navigationBar, identifier:"Page 7 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        deleteKey2.tap()
        
        app.otherElements.containing(.navigationBar, identifier:"Page 8 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        deleteKey2.tap()
        
        app.otherElements.containing(.navigationBar, identifier:"Page 9 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        deleteKey2.tap()
        
        app.otherElements.containing(.navigationBar, identifier:"Page 10 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        deleteKey2.tap()
        
        app.otherElements.containing(.navigationBar, identifier:"Page 11 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        deleteKey2.tap()
        
        app.otherElements.containing(.navigationBar, identifier:"Page 12 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        deleteKey2.tap()
        
        let element = app.otherElements.containing(.navigationBar, identifier:"Page 13 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.swipeLeft()
        deleteKey2.tap()

        app.otherElements.containing(.navigationBar, identifier:"Page 14 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        deleteKey2.tap()
        app.buttons["Save"].tap()
        
    }
    
    func testDoctorInputUIAllPages() {
        
        let app = XCUIApplication()
        app.navigationBars["Pulmonis.View"].buttons["⚙"].tap()
        app.tables.staticTexts["Doctor's Input"].tap()
        
        let element12 = app.otherElements.containing(.navigationBar, identifier:"Page 1 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        var textField = element12.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        XCTAssertEqual(textField.value as! String, "brown")
        element12.swipeLeft()
        
        let element = app.otherElements.containing(.navigationBar, identifier:"Page 2 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        textField = element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        XCTAssertEqual(textField.value as! String, "2")
        element.swipeLeft()
        
        let element2 = app.otherElements.containing(.navigationBar, identifier:"Page 3 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        textField = element2.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        XCTAssertEqual(textField.value as! String, "3")
        element2.swipeLeft()

        let element13 = app.otherElements.containing(.navigationBar, identifier:"Page 4 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        textField = element13.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        XCTAssertEqual(textField.value as! String, "orange")
        element13.swipeLeft()
        
        let element3 = app.otherElements.containing(.navigationBar, identifier:"Page 5 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        textField = element3.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        XCTAssertEqual(textField.value as! String, "2")
        element3.swipeLeft()
        app.otherElements.containing(.navigationBar, identifier:"Page 6 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        
        let element4 = app.otherElements.containing(.navigationBar, identifier:"Page 7 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        textField = element4.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        XCTAssertEqual(textField.value as! String, "4")
        element4.swipeLeft()
        
        let element5 = app.otherElements.containing(.navigationBar, identifier:"Page 8 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        textField = element5.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        XCTAssertEqual(textField.value as! String, "3")
        element5.swipeLeft()
        
        let element6 = app.otherElements.containing(.navigationBar, identifier:"Page 9 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        textField = element6.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        XCTAssertEqual(textField.value as! String, "4")
        element6.swipeLeft()
        
        let element7 = app.otherElements.containing(.navigationBar, identifier:"Page 10 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        textField = element7.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        XCTAssertEqual(textField.value as! String, "5")
        element7.swipeLeft()
        
        let element8 = app.otherElements.containing(.navigationBar, identifier:"Page 11 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        textField = element8.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        XCTAssertEqual(textField.value as! String, "2")
        element8.swipeLeft()
        
        let element9 = app.otherElements.containing(.navigationBar, identifier:"Page 12 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        textField = element9.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        XCTAssertEqual(textField.value as! String, "2")
        element9.swipeLeft()
        
        let element10 = app.otherElements.containing(.navigationBar, identifier:"Page 13 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        textField = element10.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        XCTAssertEqual(textField.value as! String, "3")
        element10.swipeLeft()
        
        let element11 = app.otherElements.containing(.navigationBar, identifier:"Page 14 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        textField = element11.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        XCTAssertEqual(textField.value as! String, "8")
        element11.swipeLeft()
        textField = app.otherElements.containing(.navigationBar, identifier:"Page 15 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        XCTAssertEqual(textField.value as! String, "9")
        
        app.buttons["Save"].tap()
        
    }
    
    func testDoctorInputUIReturnPerformsSegue() {
        
        
        let app = XCUIApplication()
        app.navigationBars["Pulmonis.View"].buttons["⚙"].tap()

        app.tables.staticTexts["Doctor's Input"].tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        app.typeText("\n")
        app.otherElements.containing(.navigationBar, identifier:"Page 2 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        app.otherElements.containing(.navigationBar, identifier:"Page 3 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        returnButton.tap()
        app.typeText("\n")
        app.otherElements.containing(.navigationBar, identifier:"Page 5 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        app.otherElements.containing(.navigationBar, identifier:"Page 6 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        app.otherElements.containing(.navigationBar, identifier:"Page 7 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        app.otherElements.containing(.navigationBar, identifier:"Page 8 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        app.otherElements.containing(.navigationBar, identifier:"Page 9 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        app.otherElements.containing(.navigationBar, identifier:"Page 10 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        app.otherElements.containing(.navigationBar, identifier:"Page 11 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        app.otherElements.containing(.navigationBar, identifier:"Page 12 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        app.otherElements.containing(.navigationBar, identifier:"Page 13 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        app.otherElements.containing(.navigationBar, identifier:"Page 14 of 15").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        app.buttons["Save"].tap()
        
        
        
        
    }
    
}
