//
//  Green2ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 02/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green2ViewController: ListedViewController {

    @IBOutlet weak var gRelieverInhalerColour: UITextField!
    @IBOutlet weak var gPuffsReliever: UITextField!
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 10
        nextButton.clipsToBounds = true
        
        gRelieverInhalerColour.isAccessibilityElement = true
        
        gPuffsReliever.isAccessibilityElement = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func next2(_ sender: Any) {
        if allFieldsFilled() {
            performSegue(withIdentifier: "segueGreen2", sender: nil)
        }
    }
    
    func allFieldsFilled() -> Bool {
        return !((gRelieverInhalerColour.text?.isEmpty)! ||
            (gPuffsReliever.text?.isEmpty)!)
    }
    
    override func saveInputToPList() {
        if let plist = Plist(name: "PatientData") {
            
            let dict = plist.getMutablePlistFile()!
            
            dict["gRelieverInhalerColour"] = self.gRelieverInhalerColour.text
            dict["gPuffsReliever"] = self.gPuffsReliever.text
            
            do {
                try plist.addValuesToPlistFile(dictionary: dict)
            } catch {
                print(error)
            }
            
        } else {
            print("Unable to get Plist")
        }
    }


}
