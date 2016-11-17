//
//  Yellow7ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Yellow7ViewController: ListedViewController {

    @IBOutlet weak var yTabletDuration: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yTabletDuration.layer.masksToBounds = true
        yTabletDuration.layer.borderColor = Colours.yellow.cgColor
        yTabletDuration.layer.borderWidth = 2.0
        
        yTabletDuration.text = ListedViewController.patientData[yTabletDurationStr]! as? String
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        yTabletDuration.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func saveField() {
        if (yTabletDuration != nil) {
            ListedViewController.patientData[yTabletDurationStr] = yTabletDuration.text
        }
    }


}
