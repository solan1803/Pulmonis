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
        
        rMinimumPeakFlow.text = ListedViewController.patientData["rMinimumPeakFlow"]! as? String
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        rMinimumPeakFlow.becomeFirstResponder()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController: parent)
        
        if (rMinimumPeakFlow != nil) {
            ListedViewController.patientData["rMinimumPeakFlow"] = rMinimumPeakFlow.text
        }
    }
    
    @IBAction func save(_ sender: Any) {
        
        ListedViewController.patientData["rMinimumPeakFlow"] = rMinimumPeakFlow.text
        
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
    


}
