//
//  Green1ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green1ViewController: ListedViewController {

    
    @IBOutlet weak var gPreventerInhalerColour: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gPreventerInhalerColour.isAccessibilityElement = true
        gPuffsMorning.isAccessibilityElement = true
        gPuffsNight.isAccessibilityElement = true
        // Do any additional setup after loading the view.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        //let tap2: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
    }
    
    func printStuff() {
       
    }
    
    override func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        print("--------------------printing--------------------")
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController2: Green2ViewController = segue.destination as! Green2ViewController
    
        destViewController2.green1 = self

    }
    */
 
 
    @IBAction func next1(_ sender: Any) {
        if allFieldsFilled() {
            performSegue(withIdentifier: "segueGreen1", sender: nil)
        }
    }
    
    func allFieldsFilled() -> Bool {
        return !((gPreventerInhalerColour.text?.isEmpty)! ||
               (gPuffsMorning.text?.isEmpty)! ||
               (gPuffsNight.text?.isEmpty)!)
    }
    
    override func saveInputToPList() {
        if let plist = Plist(name: "PatientData") {
            
            let dict = plist.getMutablePlistFile()!
            
            ListedViewController.patientData = dict
        }
        
        gPreventerInhalerColour.text = ListedViewController.patientData["gPreventerInhalerColour"]! as? String
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        gPreventerInhalerColour.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func saveField() {
        if (gPreventerInhalerColour != nil) {
            ListedViewController.patientData["gPreventerInhalerColour"] = gPreventerInhalerColour.text
        }
    }

}
