//
//  Orange1ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 03/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Orange1ViewController: ListedViewController {

    @IBOutlet weak var oWeeklyRelieverUses: UITextField!
    @IBOutlet weak var oMinimumPeakFlow: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func next1(_ sender: Any) {
        if allFieldsFilled() {
            performSegue(withIdentifier: "segueOrange1", sender: nil)
        }
    }
    
    func allFieldsFilled() -> Bool {
        return !((oWeeklyRelieverUses.text?.isEmpty)! ||
            (oMinimumPeakFlow.text?.isEmpty)!)
    }
    
    override func saveInputToPList() {
        if let plist = Plist(name: "PatientData") {
            
            let dict = plist.getMutablePlistFile()!
            
            dict["oWeeklyRelieverUses"] = self.oWeeklyRelieverUses.text
            dict["oMinimumPeakFlow"] = self.oMinimumPeakFlow.text
            
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
