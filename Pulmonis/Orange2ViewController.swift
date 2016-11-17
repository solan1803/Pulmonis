//
//  Orange2ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 03/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Orange2ViewController: ListedViewController {

    @IBOutlet weak var oIncreasedPreventerDosage: UITextField!
    @IBOutlet weak var oIncreasedPreventerFrequency: UITextField!
    @IBOutlet weak var oIncreasedRelieverFrequency: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.layer.cornerRadius = 10
        nextButton.clipsToBounds = true
        
        oIncreasedPreventerDosage.isAccessibilityElement = true
        oIncreasedPreventerFrequency.isAccessibilityElement = true
        oIncreasedRelieverFrequency.isAccessibilityElement = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func next2(_ sender: Any) {
        if allFieldsFilled() {
            performSegue(withIdentifier: "segueOrange2", sender: nil)
        }
    }
    
    func allFieldsFilled() -> Bool {
        return !((oIncreasedPreventerDosage.text?.isEmpty)! ||
            (oIncreasedPreventerFrequency.text?.isEmpty)! ||
            (oIncreasedRelieverFrequency.text?.isEmpty)!)
    }
    
    override func saveInputToPList() {
        if let plist = Plist(name: "PatientData") {
            
            let dict = plist.getMutablePlistFile()!
            
            dict["oIncreasedPreventerDosage"] = self.oIncreasedPreventerDosage.text
            dict["oIncreasedPreventerFrequency"] = self.oIncreasedPreventerFrequency.text
            dict["oIncreasedRelieverFrequency"] = self.oIncreasedRelieverFrequency.text
            
            do {
                try plist.addValuesToPlistFile(dictionary: dict)
            } catch {
                print(error)
            }
            
            
        } else {
            print("Unable to get Plist")
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
