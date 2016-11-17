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

        let myColor : UIColor = UIColor( red: 255/255, green: 194/255, blue:33/255, alpha: 1.0 )
        yMinimumPeakFlow.layer.masksToBounds = true
        yMinimumPeakFlow.layer.borderColor = myColor.cgColor
        yMinimumPeakFlow.layer.borderWidth = 2.0
        
        yMinimumPeakFlow.text = ListedViewController.patientData["yMinimumPeakFlow"]! as? String
        
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
            ListedViewController.patientData["yMinimumPeakFlow"] = yMinimumPeakFlow.text
        }
    }

}
