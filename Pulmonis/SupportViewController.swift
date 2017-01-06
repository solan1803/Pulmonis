//
//  SupportViewController.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 01/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit
import CoreData

class SupportViewController: UIViewController {

    // MARK: Model
    
    // if this is nil, then we simply don't update the database
    // having this default to the AppDelegate's context is a little bit of "demo cheat"
    // probably it would be better to subclass TweetTableViewController
    // and set this var in that subclass and then use that subclass in our storyboard
    // (the only purpose of that subclass would be to pick what database we're using)
    var managedObjectContext: NSManagedObjectContext? =
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var supportTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirmLogInhaler(_ sender: UIButton) {
        let refreshAlert = UIAlertController(title: "Please confirm reliever inhaler usage:", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
            self.dismiss(animated: true, completion: nil)
            self.saveLogInhalerValue()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
    }
    
    func saveLogInhalerValue() {
        print("[DEBUG] Inside saveLogInhalerValue")
        var val : Int16 = 3 // default 3 puffs
        if let plist = Plist(name: "PatientData") {
            let dict = plist.getMutablePlistFile()!
            
            if let gPuffsR = dict[gPuffsRelieverStr] {
                if let gPuffsRString = gPuffsR as? String {
                    if gPuffsRString != "" {
                        val = Int16(gPuffsRString)!
                    }
                }
            }
        }
        if let support_record = NSEntityDescription.insertNewObject(forEntityName: "SupportRecord", into: managedObjectContext!) as? SupportRecord {
            support_record.date = NSDate()
            support_record.value = val
        }
        do {
            try managedObjectContext?.save()
        } catch let error {
            print(error)
        }
        
        checkCondition()
        
    }
    
    func checkCondition() {
        let yrequest: NSFetchRequest<SupportRecord> = SupportRecord.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        yrequest.sortDescriptors = [sortDescriptor]
        let calendar = NSCalendar.current
        let sevenDaysAgo = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        var startDate = calendar.startOfDay(for: sevenDaysAgo!)
        let predicate = NSPredicate(format:"(date >= %@)", startDate as NSDate)
        yrequest.predicate = predicate
        let yresult = try? managedObjectContext!.fetch(yrequest)
        
        var yWeeklyReliever: Int16 = 5
        var rHoursReliever: Int16 = 2
        
        if let plist = Plist(name: "PatientData") {
            let dict = plist.getMutablePlistFile()!
            
            if let yWeeklyRelieverUses = dict[yWeeklyRelieverUsesStr] {
                if let yWeeklyRelieverUsesString = yWeeklyRelieverUses as? String {
                    if yWeeklyRelieverUsesString != "" {
                        yWeeklyReliever = Int16(yWeeklyRelieverUsesString)!
                    }
                }
            }
            
            if let rRelieverFrequencyLimit = dict[rRelieverFrequencyLimitStr] {
                if let rRelieverFrequencyLimitString = rRelieverFrequencyLimit as? String {
                    if rRelieverFrequencyLimitString != "" {
                        rHoursReliever = Int16(rRelieverFrequencyLimitString)!
                    }
                }
            }
        } else {
            //Error with opening the PList
        }
        
        let rRequest: NSFetchRequest<SupportRecord> = SupportRecord.fetchRequest()
        rRequest.sortDescriptors = [sortDescriptor]
        let backHours = Calendar.current.date(byAdding: .hour, value: -1 * Int(rHoursReliever), to: Date())
        startDate = calendar.startOfDay(for: backHours!)
        let rPredicate = NSPredicate(format:"(date >= %@)", startDate as NSDate)
        rRequest.predicate = rPredicate
        let rResult = try? managedObjectContext!.fetch(rRequest)
        
        /* Karow and Ziyi need to access plist to get the correct threshold value for patient. */
        if (Int16(rResult!.count) > 1) { // Action Plan 'critical' value
            performSegue(withIdentifier: "criticalSegue", sender: self)
        } else if (Int16(yresult!.count) > yWeeklyReliever) {
            performSegue(withIdentifier: "worseSegue", sender: self)
        } else {
            navigationController!.popToViewController(navigationController!.viewControllers[0], animated: true)
        }
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
