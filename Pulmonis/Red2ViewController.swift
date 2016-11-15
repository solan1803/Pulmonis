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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rMinimumPeakFlow.text = ListedViewController.patientData["rMinimumPeakFlow"]! as? String

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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
