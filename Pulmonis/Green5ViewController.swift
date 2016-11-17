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
