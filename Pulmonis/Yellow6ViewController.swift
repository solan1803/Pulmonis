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

        yTabletDosage.layer.masksToBounds = true
        yTabletDosage.layer.borderColor = Colours.yellow.cgColor
        yTabletDosage.layer.borderWidth = 2.0
        
        yTabletDosage.text = ListedViewController.patientData[yTabletDosageStr]! as? String
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
            ListedViewController.patientData[yTabletDosageStr] = yTabletDosage.text
        }
    }

}
