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

        yIncreasedPreventerDosage.text = ListedViewController.patientData["yIncreasedPreventerDosage"]! as? String

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        yIncreasedPreventerDosage.becomeFirstResponder()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func saveField() {
        if (yIncreasedPreventerDosage != nil) {
            ListedViewController.patientData["yIncreasedPreventerDosage"] = yIncreasedPreventerDosage.text
        }
    }

}
