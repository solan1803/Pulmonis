//
//  Green2ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green2ViewController: ListedViewController {

    
    @IBOutlet weak var gPuffsMorning: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gPuffsMorning.text = ListedViewController.patientData["gPuffsMorning"]! as? String
        //self.gPuffsMorning.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        gPuffsMorning.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        ListedViewController.patientData["gPuffsMorning"] = gPuffsMorning.text
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController: parent)
        if (gPuffsMorning != nil) {
            ListedViewController.patientData["gPuffsMorning"] = gPuffsMorning.text
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
