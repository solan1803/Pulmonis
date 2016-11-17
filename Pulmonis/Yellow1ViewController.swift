//
//  Yellow1ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Yellow1ViewController: ListedViewController {

    @IBOutlet weak var yWeeklyRelieverUses: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yWeeklyRelieverUses.text = ListedViewController.patientData["yWeeklyRelieverUses"]! as? String
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        yWeeklyRelieverUses.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func saveField() {
        if (yWeeklyRelieverUses != nil) {
            ListedViewController.patientData["yWeeklyRelieverUses"] = yWeeklyRelieverUses.text
        }
    }

}
