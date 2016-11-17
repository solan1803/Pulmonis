//
//  Green2ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green2ViewController: ListedViewController {

    
    @IBOutlet weak var gPuffsMorning: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gPuffsMorning.layer.masksToBounds = true
        gPuffsMorning.layer.borderColor = Colours.green.cgColor
        gPuffsMorning.layer.borderWidth = 2.0
        
        gPuffsMorning.text = ListedViewController.patientData[gPuffsMorningStr]! as? String
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        gPuffsMorning.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func saveField() {
        if (gPuffsMorning != nil) {
            ListedViewController.patientData[gPuffsMorningStr] = gPuffsMorning.text
        }
    }


}
