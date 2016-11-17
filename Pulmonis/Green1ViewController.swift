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
        
        let myColor : UIColor = UIColor( red: 0/255, green: 167/255, blue:82/255, alpha: 1.0 )
        gPreventerInhalerColour.layer.masksToBounds = true
        gPreventerInhalerColour.layer.borderColor = myColor.cgColor
        gPreventerInhalerColour.layer.borderWidth = 2.0
        
        if let plist = Plist(name: "PatientData") {
            
            let dict = plist.getMutablePlistFile()!
            ListedViewController.patientData = dict
        }
        
        gPreventerInhalerColour.text = ListedViewController.patientData["gPreventerInhalerColour"]! as? String
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        gPreventerInhalerColour.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func saveField() {
        if (gPreventerInhalerColour != nil) {
            ListedViewController.patientData["gPreventerInhalerColour"] = gPreventerInhalerColour.text
        }
    }

}
