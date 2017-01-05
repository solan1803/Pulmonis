//
//  Yellow3ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Yellow3ViewController: ListedViewController {

    @IBOutlet weak var yIncreasedPreventerDosage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yIncreasedPreventerDosage.layer.masksToBounds = true
        yIncreasedPreventerDosage.layer.borderColor = Colours.yellow.cgColor
        yIncreasedPreventerDosage.layer.borderWidth = 2.0
        
        yIncreasedPreventerDosage.text = ListedViewController.patientData[yIncreasedPreventerDosageStr]! as? String

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        yIncreasedPreventerDosage.becomeFirstResponder()
    }

    override func saveField() {
        if (yIncreasedPreventerDosage != nil) {
            ListedViewController.patientData[yIncreasedPreventerDosageStr] = yIncreasedPreventerDosage.text
        }
    }

}
