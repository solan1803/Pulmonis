//
//  Yellow3ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Yellow3ViewController: ListedViewController {

    @IBOutlet weak var yIncreasedPreventerDosage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myColor : UIColor = UIColor( red: 255/255, green: 194/255, blue:33/255, alpha: 1.0 )
        yIncreasedPreventerDosage.layer.masksToBounds = true
        yIncreasedPreventerDosage.layer.borderColor = myColor.cgColor
        yIncreasedPreventerDosage.layer.borderWidth = 2.0
        
        yIncreasedPreventerDosage.text = ListedViewController.patientData["yIncreasedPreventerDosage"]! as? String

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        yIncreasedPreventerDosage.becomeFirstResponder()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func saveField() {
        if (yIncreasedPreventerDosage != nil) {
            ListedViewController.patientData["yIncreasedPreventerDosage"] = yIncreasedPreventerDosage.text
        }
    }

}
