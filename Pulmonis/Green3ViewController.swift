//
//  Green3ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green3ViewController: ListedViewController {

    
    @IBOutlet weak var gPuffsNight: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gPuffsNight.text = ListedViewController.patientData["gPuffsNight"]! as? String
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        gPuffsNight.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func saveField() {
        if (gPuffsNight != nil) {
            ListedViewController.patientData["gPuffsNight"] = gPuffsNight.text
        }
    }

}
