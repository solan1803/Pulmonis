//
//  WorsePopoverViewController.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 29/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class WorsePopoverViewController: UIViewController {

    @IBOutlet weak var preventerDosageIncreaseLabel: UILabel!
    
    @IBOutlet weak var relieverDosageIncreaseLabel: UILabel!
    @IBOutlet weak var urgentMessageLabel: UILabel!
    
    @IBOutlet weak var plusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plusButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        if let plist = Plist(name: "PatientData") {
            let dict = plist.getMutablePlistFile()!
            
            var preventerDosage = ""
            if let d = (dict[yIncreasedPreventerDosageStr]! as? String){
                if d != "" {
                    preventerDosage = d
                }
            }
            var preventerFreq = ""
            if let d = (dict[yIncreasedPreventerFrequencyStr]! as? String){
                if d != "" {
                    preventerFreq = d
                }
            }
            preventerDosageIncreaseLabel.text = "Please increase your preventer inhaler dose to \(preventerDosage) puffs \(preventerFreq) times a day until your symptoms have gone and your peak flow is back to normal"
            
            var relieverFreq = ""
            if let d = (dict[yIncreasedRelieverFrequencyStr]! as? String){
                if d != "" {
                    relieverFreq = d
                }
            }
            
            relieverDosageIncreaseLabel.text = "Please take your reliever inhaler as needed (up to \(relieverFreq) puffs every four hours)"
            
            urgentMessageLabel.text =  "URGENT! If you don’t improve within 24 hours make an emergency appointment to see your GP or asthma nurse, and to let them know that you have started taking steroids"
        } else {
            //Error with opening the PList
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissPopover(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
