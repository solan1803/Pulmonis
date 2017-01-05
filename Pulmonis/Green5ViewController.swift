//
//  Green5ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green5ViewController: ListedViewController {

    @IBOutlet weak var gPuffsReliever: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gPuffsReliever.layer.masksToBounds = true
        gPuffsReliever.layer.borderColor = Colours.green.cgColor
        gPuffsReliever.layer.borderWidth = 2.0
        
        gPuffsReliever.text = ListedViewController.patientData[gPuffsRelieverStr]! as? String
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        gPuffsReliever.becomeFirstResponder()
    }

    override func saveField() {
        if (gPuffsReliever != nil) {
            ListedViewController.patientData[gPuffsRelieverStr] = gPuffsReliever.text
        }
    }

}
