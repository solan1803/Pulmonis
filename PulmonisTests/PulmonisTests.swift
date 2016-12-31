//
//  PulmonisTests.swift
//  PulmonisTests
//
//  Created by Manivannan Solan on 14/10/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import XCTest
@testable import Pulmonis

class PulmonisTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //test accesses to property list
    func testPlistAccess() {
        
        var initVal: String = ""
        
        //save initial data and write to plist with test data
        if let plist = Plist(name: "PatientData") {
            
            let dict = plist.getMutablePlistFile()!
            
            initVal = (dict["gPreventerInhalerColour"] as? String)!
            
            dict["gPreventerInhalerColour"] = "AccessTestCase"
            
            do {
                try plist.addValuesToPlistFile(dictionary: dict)
            } catch {
                print("Error, could not save Plist")
            }
        
        } else {
            XCTAssert(false)
        }
        
        //check that test data is present then restore old data
        if let plist = Plist(name: "PatientData") {
            
            let dict = plist.getMutablePlistFile()!
            
            let testVar: String = (dict["gPreventerInhalerColour"] as? String)!
            
            XCTAssert(testVar == "AccessTestCase")
            
            dict["gPreventerInhalerColour"] = initVal
            
            do {
                try plist.addValuesToPlistFile(dictionary: dict)
            } catch {
                print("Error, could not save Plist")
            }
            
        } else {
            XCTAssert(false)
        }
        
    }
    
}
