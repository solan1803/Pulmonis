//
//  SymptomActionPlanViewController.swift
//  Pulmonis
//
//  Created by Seng, Sophie on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class SymptomActionPlanViewController: UIViewController {

    @IBOutlet weak var wheezingButton: UIButton!
    @IBOutlet weak var chestTightnessButton: UIButton!
    @IBOutlet weak var difficultyBreathingButton: UIButton!
    @IBOutlet weak var coughButton: UIButton!
    @IBOutlet weak var wakingUpAtNightButton: UIButton!
    @IBOutlet weak var ADLButton: UIButton!
    @IBOutlet weak var difficultyTalkingButton: UIButton!
    @IBOutlet weak var difficultyWalkingButton: UIButton!
    @IBOutlet weak var noneNextButton: UIButton!
    
    // transparent, green, orange, red
    var colourHexCodes: [String] = ["#FFFFFF00", "#00A752FF", "#FFC221FF", "#C51426FF"]
    
    var buttonColours: [UIColor] =
        [UIColor(red: 0, green: 0, blue: 0, alpha: 0),
         UIColor(red: 0, green: 167/255, blue: 82/255, alpha: 255/255),
         UIColor(red: 255/255, green: 194/255, blue: 33/255, alpha: 255/255),
         UIColor(red: 197/255, green: 20/255, blue: 38/255, alpha: 255/255)]
    
    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextColour(_ sender: UIButton) {
        var currentColourIndex : Int = 0;
        for (index, buttonColour) in buttonColours.enumerated() {
            if (sender.backgroundColor == nil) {
                currentColourIndex = 0
                break
            }
            if sender.backgroundColor!.isEqual(buttonColour) {
                currentColourIndex = index
                break
            }
        }
        sender.backgroundColor = buttonColours[(currentColourIndex + 1) % buttonColours.count]
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
