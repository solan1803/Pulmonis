//
//  Green6ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green6ViewController: ListedViewController {

    @IBOutlet weak var gOtherMedicine: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myColor : UIColor = UIColor( red: 0/255, green: 167/255, blue:82/255, alpha: 1.0 )
        gOtherMedicine.layer.masksToBounds = true
        gOtherMedicine.layer.borderColor = myColor.cgColor
        gOtherMedicine.layer.borderWidth = 2.0

        gOtherMedicine.text = ListedViewController.patientData["gOtherMedicine"]! as? String
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        gOtherMedicine.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func saveField() {
        if (gOtherMedicine != nil) {
            ListedViewController.patientData["gOtherMedicine"] = gOtherMedicine.text
        }
    }

}
