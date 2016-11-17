//
//  Red2ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Red2ViewController: ListedViewController {

    @IBOutlet weak var rMinimumPeakFlow: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rMinimumPeakFlow.layer.masksToBounds = true
        rMinimumPeakFlow.layer.borderColor = Colours.red.cgColor
        rMinimumPeakFlow.layer.borderWidth = 2.0
        
        rMinimumPeakFlow.text = ListedViewController.patientData[rMinimumPeakFlowStr]! as? String
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        rMinimumPeakFlow.becomeFirstResponder()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func save(_ sender: Any) {
        
        ListedViewController.patientData[rMinimumPeakFlowStr] = rMinimumPeakFlow.text
        
        if let plist = Plist(name: "PatientData") {

            do {
                try plist.addValuesToPlistFile(dictionary: ListedViewController.patientData)
            } catch {
                print(error)
            }
            
        } else {
            print("Unable to get Plist")
        }
        
        performSegue(withIdentifier: "save", sender: nil)
    }
    
    override func saveField() {
        if (rMinimumPeakFlow != nil) {
            ListedViewController.patientData[rMinimumPeakFlowStr] = rMinimumPeakFlow.text
        }
    }

}
