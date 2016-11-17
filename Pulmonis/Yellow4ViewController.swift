//
//  Yellow4ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Yellow4ViewController: ListedViewController {

    @IBOutlet weak var yIncreasedPreventerFrequency: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myColor : UIColor = UIColor( red: 255/255, green: 194/255, blue:33/255, alpha: 1.0 )
        yIncreasedPreventerFrequency.layer.masksToBounds = true
        yIncreasedPreventerFrequency.layer.borderColor = myColor.cgColor
        yIncreasedPreventerFrequency.layer.borderWidth = 2.0
        
        yIncreasedPreventerFrequency.text = ListedViewController.patientData["yIncreasedPreventerFrequency"]! as? String
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        yIncreasedPreventerFrequency.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func saveField() {
        if (yIncreasedPreventerFrequency != nil) {
            ListedViewController.patientData["yIncreasedPreventerFrequency"] = yIncreasedPreventerFrequency.text
        }
    }

}
