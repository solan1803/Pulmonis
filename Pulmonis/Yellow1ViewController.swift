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

        let myColor : UIColor = UIColor( red: 255/255, green: 194/255, blue:33/255, alpha: 1.0 )
        yWeeklyRelieverUses.layer.masksToBounds = true
        yWeeklyRelieverUses.layer.borderColor = myColor.cgColor
        yWeeklyRelieverUses.layer.borderWidth = 2.0

        
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
