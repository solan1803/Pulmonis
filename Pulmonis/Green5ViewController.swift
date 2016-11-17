//
//  Green5ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green5ViewController: ListedViewController {

    @IBOutlet weak var gPuffsReliever: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myColor : UIColor = UIColor( red: 0/255, green: 167/255, blue:82/255, alpha: 1.0 )
        gPuffsReliever.layer.masksToBounds = true
        gPuffsReliever.layer.borderColor = myColor.cgColor
        gPuffsReliever.layer.borderWidth = 2.0
        
        gPuffsReliever.text = ListedViewController.patientData["gPuffsReliever"]! as? String
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        gPuffsReliever.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func saveField() {
        if (gPuffsReliever != nil) {
            ListedViewController.patientData["gPuffsReliever"] = gPuffsReliever.text
        }
    }

}
