//
//  Green4ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green4ViewController: ListedViewController {

    @IBOutlet weak var gRelieverInhalerColour: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gRelieverInhalerColour.text = ListedViewController.patientData["gRelieverInhalerColour"]! as? String
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        ListedViewController.patientData["gRelieverInhalerColour"] = gRelieverInhalerColour.text
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController: parent)
        
        if (gRelieverInhalerColour != nil) {
            ListedViewController.patientData["gRelieverInhalerColour"] = gRelieverInhalerColour.text
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
