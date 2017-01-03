//
//  PollenForecastTests.swift
//  Pulmonis
//
//  Created by Sophie Seng on 03/01/2017.
//  Copyright © 2017 Manivannan Solan. All rights reserved.
//

import XCTest
@testable import Pulmonis


class PollenForecastTests: XCTestCase {
    
    var vc: PollenChartViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "PollenChart", bundle: Bundle.main)
        vc = storyboard.instantiateViewController(withIdentifier :"pollen") as! PollenChartViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testForecastURLGeneration() {
        let url : NSURL = generateForecastURL(key: "123")
        let request : NSURLRequest = NSURLRequest(url: url as URL)
        XCTAssert(UIApplication.shared.canOpenURL(url as URL) && NSURLConnection.canHandle(request as URLRequest))
    }
    
    func testLocationKeyURLGeneration() {
        let url : NSURL = generateLocationURL(latitude: 51, longitude: 0)
        let request : NSURLRequest = NSURLRequest(url: url as URL)
        XCTAssert(UIApplication.shared.canOpenURL(url as URL) && NSURLConnection.canHandle(request as URLRequest))
    }
    
    func testFetchingOfErroneousCoordinatesDoesNotCrash() {
        vc.getLocationKey(latitude: 0, longitude: 0)
        XCTAssert(true)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
