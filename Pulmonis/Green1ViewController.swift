//
//  Green1ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green1ViewController: ListedViewController {

    
    @IBOutlet weak var gPreventerInhalerColour: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let plist = Plist(name: "PatientData") {
            
            let dict = plist.getMutablePlistFile()!
            
            ListedViewController.patientData = dict
            
        }
        
        gPreventerInhalerColour.text = ListedViewController.patientData["gPreventerInhalerColour"]! as? String
        //gPreventerInhalerColour.becomeFirstResponder()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        gPreventerInhalerColour.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        ListedViewController.patientData["gPreventerInhalerColour"] = gPreventerInhalerColour.text
        gPreventerInhalerColour.becomeFirstResponder()
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
