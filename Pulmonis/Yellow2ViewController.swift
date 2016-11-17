//
//  Yellow2ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Yellow2ViewController: ListedViewController {

    @IBOutlet weak var yMinimumPeakFlow: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yMinimumPeakFlow.layer.masksToBounds = true
        yMinimumPeakFlow.layer.borderColor = Colours.yellow.cgColor
        yMinimumPeakFlow.layer.borderWidth = 2.0
        
        yMinimumPeakFlow.text = ListedViewController.patientData[yMinimumPeakFlowStr]! as? String
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        yMinimumPeakFlow.becomeFirstResponder()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func saveField() {
        if (yMinimumPeakFlow != nil) {
            ListedViewController.patientData[yMinimumPeakFlowStr] = yMinimumPeakFlow.text
        }
    }

}
