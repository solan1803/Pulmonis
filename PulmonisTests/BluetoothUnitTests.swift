//
//  BluetoothUnitTests.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 24/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import XCTest
@testable import Pulmonis

class BluetoothUnitTests: XCTestCase {
    
    var pfc : PeakFlowViewController!
    let epsilon = 0.00001
    
    func diff(first: Double, second: Double) -> Bool {
        return abs(first - second) < epsilon
    }
    
    func toByteArray<T>(_ value: T) -> [UInt8] {
        var value = value
        return withUnsafeBytes(of: &value) { Array($0) }
    }
    
    func testConvertFloatToByteArray() {
        let toBytes = toByteArray(2.2 as Float)
        XCTAssert(toBytes == ([0xcd, 0xcc, 0x0c, 0x40] as [UInt8]))
    }
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "ActionPlan", bundle: Bundle.main)
        pfc = storyboard.instantiateViewController(withIdentifier: "PeakFlowController") as! PeakFlowViewController
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /* Sending over 2.2 */
    func testReadingIn4BytesFor1Float() {
        var data : NSData?
        let bytes = toByteArray(2.2 as Float)
        data = NSData(bytes: bytes, length: bytes.count)
        pfc.bleDidReceiveData(data: data)
        XCTAssert(pfc.readings.count == 1)
        XCTAssert(diff(first: pfc.readings[0],second: 2.2))
    }
    
    /* Sending over 2.2 twice in one buffer send */
    func testBufferOfArduinoInSendingValues() {
        var data : NSData?
        var bytes = toByteArray(2.2 as Float)
        bytes.append(contentsOf: (toByteArray(2.2 as Float)))
        data = NSData(bytes: bytes, length: bytes.count)
        pfc.bleDidReceiveData(data: data)
        XCTAssert(pfc.readings.count == 2)
        XCTAssert(diff(first: pfc.readings[0],second: 2.2))
        XCTAssert(diff(first: pfc.readings[1],second: 2.2))
    }
    
    /* Testing reading of floats sent one at a time by arduino */
    func testReadingIn10Floats() {
        for i in 0..<10 {
            var data : NSData?
            let bytes = toByteArray(1.5 as Float)
            data = NSData(bytes: bytes, length: bytes.count)
            pfc.bleDidReceiveData(data: data)
            XCTAssert(pfc.readings.count == i+1)
            XCTAssert(diff(first: pfc.readings[i],second: 1.5))
        }
    }
    
    /* Emptying readings after each breath based on signal sent by arduino */
    func testEndOfBreathEmptyReadingsArray() {
        for _ in 0..<20 {
            var data : NSData?
            let bytes = toByteArray(1.5 as Float)
            data = NSData(bytes: bytes, length: bytes.count)
            pfc.bleDidReceiveData(data: data)
        }
        XCTAssert(pfc.readings.count == 20)
        var data : NSData?
        let bytes = toByteArray(1 as UInt8)
        data = NSData(bytes: bytes, length: bytes.count)
        pfc.bleDidReceiveData(data: data)
        XCTAssert(pfc.readings.count == 0)
    }
}
