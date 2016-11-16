//
//  Yellow6ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Yellow6ViewController: ListedViewController {

    @IBOutlet weak var yTabletDosage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yTabletDosage.text = ListedViewController.patientData["yTabletDosage"]! as? String
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        yTabletDosage.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func saveField() {
        if (yTabletDosage != nil) {
            ListedViewController.patientData["yTabletDosage"] = yTabletDosage.text
        }
    }

}
