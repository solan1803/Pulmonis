//
//  Orange3ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 03/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Orange3ViewController: ListedViewController {

    @IBOutlet weak var oTabletDosage: UITextField!
    @IBOutlet weak var oTabletDosageFiveMg: UITextField!
    @IBOutlet weak var oTabletDuration: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Intentionally empty
    }
    
    func allFieldsFilled() -> Bool {
        return !((oTabletDosage.text?.isEmpty)! ||
            (oTabletDosageFiveMg.text?.isEmpty)! ||
            (oTabletDuration.text?.isEmpty)!)
    }
    
    override func saveInputToPList() {
        if let plist = Plist(name: "PatientData") {
            
            let dict = plist.getMutablePlistFile()!
            
            dict["oTabletDosage"] = self.oTabletDosage.text
            dict["oTabletDuration"] = self.oTabletDuration.text
            
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

}
