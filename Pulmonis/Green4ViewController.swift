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

        gRelieverInhalerColour.layer.masksToBounds = true
        gRelieverInhalerColour.layer.borderColor = Colours.green.cgColor
        gRelieverInhalerColour.layer.borderWidth = 2.0
        
        gRelieverInhalerColour.text = ListedViewController.patientData[gRelieverInhalerColourStr]! as? String
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        gRelieverInhalerColour.becomeFirstResponder()
    }
    
    @IBAction func textFieldPrimaryActionTriggered(_ sender: Any) {
        performSegue(withIdentifier: "segue4", sender: nil)
    }
    
    override func saveField() {
        if (gRelieverInhalerColour != nil) {
            ListedViewController.patientData[gRelieverInhalerColourStr] = gRelieverInhalerColour.text
        }
    }

}
