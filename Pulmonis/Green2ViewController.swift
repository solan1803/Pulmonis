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
        
        let myColor : UIColor = UIColor( red: 0/255, green: 167/255, blue:82/255, alpha: 1.0 )
        gPuffsMorning.layer.masksToBounds = true
        gPuffsMorning.layer.borderColor = myColor.cgColor
        gPuffsMorning.layer.borderWidth = 2.0
        
        gPuffsMorning.text = ListedViewController.patientData["gPuffsMorning"]! as? String
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
            ListedViewController.patientData["gPuffsMorning"] = gPuffsMorning.text
        }
    }


}
