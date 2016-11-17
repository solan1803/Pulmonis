//
//  Yellow5ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Yellow5ViewController: ListedViewController {

    @IBOutlet weak var yIncreasedRelieverFrequency: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yIncreasedRelieverFrequency.layer.masksToBounds = true
        yIncreasedRelieverFrequency.layer.borderColor = Colours.yellow.cgColor
        yIncreasedRelieverFrequency.layer.borderWidth = 2.0
        
        yIncreasedRelieverFrequency.text = ListedViewController.patientData[yIncreasedRelieverFrequencyStr]! as? String

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        yIncreasedRelieverFrequency.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func saveField() {
        if (yIncreasedRelieverFrequency != nil) {
            ListedViewController.patientData[yIncreasedRelieverFrequencyStr] = yIncreasedRelieverFrequency.text
        }
    }

}
