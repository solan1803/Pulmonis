//
//  SectionSelectionViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 04/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var doctorButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doctorButton.layer.cornerRadius = 10
        doctorButton.clipsToBounds = true
        
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
