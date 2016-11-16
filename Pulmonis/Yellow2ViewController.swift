//
//  Yellow2ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Yellow2ViewController: ListedViewController {

    @IBOutlet weak var yMinimumPeakFlow: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yMinimumPeakFlow.text = ListedViewController.patientData["yMinimumPeakFlow"]! as? String
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(_ : animated)
        yMinimumPeakFlow.becomeFirstResponder()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        ListedViewController.patientData["yMinimumPeakFlow"] = yMinimumPeakFlow.text
    }

    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController: parent)

        if (yMinimumPeakFlow != nil) {
            ListedViewController.patientData["yMinimumPeakFlow"] = yMinimumPeakFlow.text
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
