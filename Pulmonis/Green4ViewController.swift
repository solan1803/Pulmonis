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

        let myColor : UIColor = UIColor( red: 0/255, green: 167/255, blue:82/255, alpha: 1.0 )
        gRelieverInhalerColour.layer.masksToBounds = true
        gRelieverInhalerColour.layer.borderColor = myColor.cgColor
        gRelieverInhalerColour.layer.borderWidth = 2.0
        
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
