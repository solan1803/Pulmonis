//
//  StatsStartViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 18/10/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class StatsStartViewController: UIViewController {
    @IBOutlet weak var medicationButton: UIButton!
    @IBOutlet weak var pefButton: UIButton!
    @IBOutlet weak var symptomsButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        medicationButton.layer.cornerRadius = 10
        medicationButton.clipsToBounds = true
        
        pefButton.layer.cornerRadius = 10
        pefButton.clipsToBounds = true
        
        symptomsButton.layer.cornerRadius = 10
        symptomsButton.clipsToBounds = true

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
