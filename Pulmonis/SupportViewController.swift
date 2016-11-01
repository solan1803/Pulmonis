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
    
    @IBAction func saveSupportValue(_ sender: UIButton) {
        
        print("INSIDE SAVESUPPORTVALUE METHOD")
        if let support_record = NSEntityDescription.insertNewObject(forEntityName: "SupportRecord", into: managedObjectContext!) as? SupportRecord {
            support_record.date = NSDate()
            let text = (supportTextField.text! as NSString).integerValue
            let val = Int16(text)
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
