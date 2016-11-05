//
//  RedViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 03/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class RedViewController: ListedViewController {

    @IBOutlet weak var rRelieverFrequencyLimit: UITextField!
    @IBOutlet weak var rMinimumPeakFlow: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.layer.cornerRadius = 10
        saveButton.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(_ sender: Any) {
        if allFieldsFilled() {
            controllers.append(self)
            saveList()
            performSegue(withIdentifier: "save", sender: nil)
        }
    }
    
    func allFieldsFilled() -> Bool {
        return !((rRelieverFrequencyLimit.text?.isEmpty)! ||
            (rMinimumPeakFlow.text?.isEmpty)!)
    }
    
    override func saveInputToPList() {
        if let plist = Plist(name: "PatientData") {
            
            let dict = plist.getMutablePlistFile()!
            
            dict["rRelieverFrequencyLimit"] = self.rRelieverFrequencyLimit.text
            dict["rMinimumPeakFlow"] = self.rMinimumPeakFlow.text
            
            do {
                try plist.addValuesToPlistFile(dictionary: dict)
            } catch {
                print(error)
            }
            
            print(plist.getValuesInPlistFile() ?? "FAILLLUREEE")
            
        } else {
            print("Unable to get Plist")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Intentionally empty
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
