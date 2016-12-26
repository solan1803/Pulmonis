//
//  HealthKitTests.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 25/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import XCTest
import HealthKit

class HealthKitTests: XCTestCase {
    
    var healthStore : HKHealthStore?

    override func setUp() {
        super.setUp()
        healthStore = HKHealthStore()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSaveAndRetreivePeakFlowDataFromHealthApp() {
        
        var count : Int?
        
        if let peakFlowType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.peakExpiratoryFlowRate) {
            
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
            
            let query = HKSampleQuery(sampleType: peakFlowType, predicate: nil, limit: 30, sortDescriptors: [sortDescriptor]) { (query, tmpResult, error) -> Void in
                
                XCTAssert(error == nil)
                count = tmpResult?.count
            }
            
            healthStore?.execute(query)
        }

        
        if let peakFlowType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.peakExpiratoryFlowRate) {
            
            let object = HKQuantitySample(type: peakFlowType, quantity: HKQuantity.init(unit: HKUnit.liter().unitDivided(by: HKUnit.minute()), doubleValue: 2.5), start: Date(), end: Date())
            
            healthStore?.save(object, withCompletion: { (success, error) -> Void in
                
                XCTAssert(error == nil)
                XCTAssert(success)
                
            })
            
            
        }
        
        if let peakFlowType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.peakExpiratoryFlowRate) {
            
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
            
            let query = HKSampleQuery(sampleType: peakFlowType, predicate: nil, limit: 30, sortDescriptors: [sortDescriptor]) { (query, tmpResult, error) -> Void in
                
                if error != nil {
                    XCTFail()
                    return
                }
                XCTAssert(count!+1 == tmpResult?.count)
                self.healthStore?.delete((tmpResult?.first)!, withCompletion: { (success, error) in
                    XCTAssert(success)
                    XCTAssert(error == nil)
                })
            }
            
            healthStore?.execute(query)
        }


    }
    
}
