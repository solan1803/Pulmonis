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
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        ListedViewController.patientData["gPuffsReliever"] = gPuffsReliever.text
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController: parent)
        
        if (gPuffsReliever != nil) {
            ListedViewController.patientData["gPuffsReliever"] = gPuffsReliever.text
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
