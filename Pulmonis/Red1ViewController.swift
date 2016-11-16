//
//  Red1ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Red1ViewController: ListedViewController {

    @IBOutlet weak var rRelieverFrequencyLimit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rRelieverFrequencyLimit.text = ListedViewController.patientData["rRelieverFrequencyLimit"]! as? String
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        rRelieverFrequencyLimit.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func saveField() {
        if (rRelieverFrequencyLimit != nil) {
            ListedViewController.patientData["rRelieverFrequencyLimit"] = rRelieverFrequencyLimit.text
        }
    }

}
