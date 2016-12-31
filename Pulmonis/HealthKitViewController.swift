//
//  HealthKitViewController.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 24/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit
import HealthKit

class HealthKitViewController: UIViewController {

    let healthStore = HKHealthStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let typestoRead = Set([
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.peakExpiratoryFlowRate)!
            ])
        
        let typestoShare = Set([
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.peakExpiratoryFlowRate)!
            ])
        
        self.healthStore.requestAuthorization(toShare: typestoShare, read: typestoRead) { (success, error) -> Void in
            if success == false {
                NSLog(" Display not allowed")
            }
        }
    }
    
    @IBAction func savePeakFlowSample(_ sender: UIButton) {

        if let peakFlowType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.peakExpiratoryFlowRate) {
            
            let object = HKQuantitySample(type: peakFlowType, quantity: HKQuantity.init(unit: HKUnit.liter().unitDivided(by: HKUnit.minute()), doubleValue: 2.5), start: Date(), end: Date())
            
            healthStore.save(object, withCompletion: { (success, error) -> Void in
                
                if error != nil {
                    print("[DEBUG] Error occurred in saving to HealthKit!")
                    return
                }
                
                if success {
                    print("[DEBUG] My new data was saved in HealthKit!")
                    
                } else {
                    print("[DEBUG] Failure to save to HealthKit!")
                }
                
            })
        }
    }
    @IBAction func retrieveData(_ sender: UIButton) {
        retrievePeakFlowDataFromHealthApp()
    }
    
    func retrievePeakFlowDataFromHealthApp() {
        
        
        if let peakFlowType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.peakExpiratoryFlowRate) {
            
            // Use a sortDescriptor to get the recent data first
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
            
            // we create our query with a block completion to execute
            let query = HKSampleQuery(sampleType: peakFlowType, predicate: nil, limit: 30, sortDescriptors: [sortDescriptor]) { (query, tmpResult, error) -> Void in
                
                if error != nil {
                    // something happened
                    return
                }
                if let result = tmpResult {
                    for item in result {
                        if let sample = item as? HKQuantitySample {
                            let value = sample.quantity
                            print("Healthkit sleep: \(sample.startDate) \(sample.endDate) - value: \(value)")
                        }
                    }
                }
            }
            
            healthStore.execute(query)
        }
    }
    
}
