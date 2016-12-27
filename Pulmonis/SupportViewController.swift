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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmLogInhaler(_ sender: UIButton) {
        let text = (supportTextField.text! as NSString).integerValue
        let usage = Int16(text)
        let refreshAlert = UIAlertController(title: "Please confirm inhaler usage:", message: "Are you sure \(usage)?", preferredStyle: UIAlertControllerStyle.alert)
        
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
        let text = (supportTextField.text! as NSString).integerValue
        let val = Int16(text)
        if let support_record = NSEntityDescription.insertNewObject(forEntityName: "SupportRecord", into: managedObjectContext!) as? SupportRecord {
            support_record.date = NSDate()
            support_record.value = val
        }
        do {
            try managedObjectContext?.save()
        } catch let error {
            print(error)
        }
        let request: NSFetchRequest<SupportRecord> = SupportRecord.fetchRequest()
        let result = try? managedObjectContext!.fetch(request)
        
        for r in result! {
            print("DATE: ")
            print(r.date!)
            print("VALUE: ")
            print(r.value)
        }
        
        /* Karow and Ziyi need to access plist to get the correct threshold value for patient. */
        if (val < 2) { //Action plan 'worse' value
            performSegue(withIdentifier: "wellSegue", sender: self)
        } else if (val < 5) { // Action Plan 'critical' value
            performSegue(withIdentifier: "worseSegue", sender: self)
        } else {
            performSegue(withIdentifier: "criticalSegue", sender: self)
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
