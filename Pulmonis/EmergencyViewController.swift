//
//  EmergencyViewController.swift
//  Pulmonis
//
//  Created by Seng, Sophie on 18/10/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class EmergencyViewController: UIViewController {

    @IBOutlet weak var inhalerColourLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        inhalerColourLabel.layer.cornerRadius = 10.0
        inhalerColourLabel.clipsToBounds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
