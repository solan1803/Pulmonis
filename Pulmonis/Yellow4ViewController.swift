//
//  Yellow4ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Yellow4ViewController: ListedViewController {

    @IBOutlet weak var yIncreasedPreventerFrequency: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yIncreasedPreventerFrequency.layer.masksToBounds = true
        yIncreasedPreventerFrequency.layer.borderColor = Colours.yellow.cgColor
        yIncreasedPreventerFrequency.layer.borderWidth = 2.0
        
        yIncreasedPreventerFrequency.text = ListedViewController.patientData[yIncreasedPreventerFrequencyStr]! as? String
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        yIncreasedPreventerFrequency.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func saveField() {
        if (yIncreasedPreventerFrequency != nil) {
            ListedViewController.patientData[yIncreasedPreventerFrequencyStr] = yIncreasedPreventerFrequency.text
        }
    }

}
