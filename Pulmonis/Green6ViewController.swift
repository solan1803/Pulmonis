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

        gOtherMedicine.layer.masksToBounds = true
        gOtherMedicine.layer.borderColor = Colours.green.cgColor
        gOtherMedicine.layer.borderWidth = 2.0

        gOtherMedicine.text = ListedViewController.patientData[gOtherMedicineStr]! as? String
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
            ListedViewController.patientData[gOtherMedicineStr] = gOtherMedicine.text
        }
    }

}
