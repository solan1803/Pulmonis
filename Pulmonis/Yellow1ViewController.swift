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
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        ListedViewController.patientData["yWeeklyRelieverUses"] = yWeeklyRelieverUses.text
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController: parent)

        if (yWeeklyRelieverUses != nil) {
            ListedViewController.patientData["yWeeklyRelieverUses"] = yWeeklyRelieverUses.text
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
