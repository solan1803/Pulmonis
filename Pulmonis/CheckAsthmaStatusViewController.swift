//
//  CheckAsthmaStatusViewController.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 02/01/2017.
//  Copyright © 2017 Manivannan Solan. All rights reserved.
//

import UIKit
import CoreData
import HealthKit

class CheckAsthmaStatusViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var statusImage: UIImageView!
    
    @IBOutlet weak var asthmaStatusLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func popupHealth(_ sender: UIButton) {
        let refreshAlert = UIAlertController(title: "HealthKit Support", message: "The highest peak flow value will be automatically saved to the Health app", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { (action: UIAlertAction!) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    let healthStore = HKHealthStore()
    
    var managedObjectContext: NSManagedObjectContext? =
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Healthkit setup */
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
        
        let request: NSFetchRequest<PeakFlowTable> = PeakFlowTable.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        request.fetchLimit = 1
        let result = try? managedObjectContext!.fetch(request)
        
        resultLabel.text = "Your highest peak flow reading was \((result?[0].value)!) L/min"
        
        // SAVE PEAK FLOW VALUE TO HEALTH APP
        if let peakFlowType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.peakExpiratoryFlowRate) {
            
            let object = HKQuantitySample(type: peakFlowType, quantity: HKQuantity.init(unit: HKUnit.liter().unitDivided(by: HKUnit.minute()), doubleValue: Double((result?[0].value)!)), start: Date(), end: Date())
            
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
        
        var worseVal: Int16 = 500
        var criticalVal: Int16 = 200
        
        if let plist = Plist(name: "PatientData") {
            let dict = plist.getMutablePlistFile()!
            
            if let yMinimumPeakFlow = dict[yMinimumPeakFlowStr] {
                if let yMinimumPeakFlowString = yMinimumPeakFlow as? String {
                    if yMinimumPeakFlowString != "" {
                        worseVal = Int16(yMinimumPeakFlowString)!
                    }
                }
            }
            
            if let rMinimumPeakFlow = dict[rMinimumPeakFlowStr] {
                if let rMinimumPeakFlowString = rMinimumPeakFlow as? String {
                    if rMinimumPeakFlowString != "" {
                        criticalVal = Int16(rMinimumPeakFlowString)!
                    }
                }
            }
        } else {
            //Error with opening the PList
        }
        let val = Int16((result?[0].value)!)
        /* Karow and Ziyi need to access plist to get the correct threshold value for patient. */
        if (val < criticalVal) { //Action plan 'worse' value
            statusImage.image = UIImage(named: "red")
            nextButton.addTarget(self, action: #selector(criticalSegue), for: .touchUpInside)
            asthmaStatusLabel.text = "According to you doctor, your asthma condition seems to be in a critical condition"
        } else if (val < worseVal) { // Action Plan 'critical' value
            statusImage.image = UIImage(named: "yellow")
            nextButton.addTarget(self, action: #selector(worseSegue), for: .touchUpInside)
            asthmaStatusLabel.text = "According to you doctor, your asthma condition seems to be in a worse condition"
        } else {
            statusImage.image = UIImage(named: "green")
            nextButton.addTarget(self, action: #selector(wellSegue), for: .touchUpInside)
            asthmaStatusLabel.text = "According to you doctor, your asthma condition seems to be in a normal condition"
        }
    
        
        
        // Do any additional setup after loading the view.
    }

    func criticalSegue(){
        performSegue(withIdentifier: "showCritical", sender: self)
    }
    
    func worseSegue(){
        performSegue(withIdentifier: "showWorse", sender: self)
    }
    
    func wellSegue(){
        performSegue(withIdentifier: "showWell", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
