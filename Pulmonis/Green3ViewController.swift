//
//  Green3ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green3ViewController: ListedViewController {

    
    @IBOutlet weak var gPuffsNight: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gPuffsNight.layer.masksToBounds = true
        gPuffsNight.layer.borderColor = Colours.green.cgColor
        gPuffsNight.layer.borderWidth = 2.0
        
        gPuffsNight.text = ListedViewController.patientData[gPuffsNightStr]! as? String
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        gPuffsNight.becomeFirstResponder()
    }

    override func saveField() {
        if (gPuffsNight != nil) {
            ListedViewController.patientData[gPuffsNightStr] = gPuffsNight.text
        }
    }

}
