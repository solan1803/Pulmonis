//
//  Green4ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green4ViewController: ListedViewController {

    @IBOutlet weak var gRelieverInhalerColour: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gRelieverInhalerColour.text = ListedViewController.patientData["gRelieverInhalerColour"]! as? String
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        gRelieverInhalerColour.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func saveField() {
        if (gRelieverInhalerColour != nil) {
            ListedViewController.patientData["gRelieverInhalerColour"] = gRelieverInhalerColour.text
        }
    }

}
