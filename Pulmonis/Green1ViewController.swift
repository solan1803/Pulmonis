//
//  Green1ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green1ViewController: ListedViewController {

    
    @IBOutlet weak var gPreventerInhalerColour: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gPreventerInhalerColour.layer.masksToBounds = true
        gPreventerInhalerColour.layer.borderColor = Colours.green.cgColor
        gPreventerInhalerColour.layer.borderWidth = 2.0
        
        if let plist = Plist(name: "PatientData") {
            
            let dict = plist.getMutablePlistFile()!
            ListedViewController.patientData = dict
        }
        print(gPreventerInhalerColour)
        gPreventerInhalerColour.text = ListedViewController.patientData[gPreventerInhalerColourStr]! as? String
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        gPreventerInhalerColour.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func textFieldPrimaryActionTriggered(_ sender: Any) {
        performSegue(withIdentifier: "segue1", sender: nil)
    }
    
    override func saveField() {
        if (gPreventerInhalerColour != nil) {
            ListedViewController.patientData[gPreventerInhalerColourStr] = gPreventerInhalerColour.text
        }
    }

}
