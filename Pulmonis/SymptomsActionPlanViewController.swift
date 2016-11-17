//
//  SymptomActionPlanViewController.swift
//  Pulmonis
//
//  Created by Seng, Sophie on 15/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class SymptomActionPlanViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var wheezingButton: UIButton!
    @IBOutlet weak var chestTightnessButton: UIButton!
    @IBOutlet weak var difficultyBreathingButton: UIButton!
    @IBOutlet weak var coughButton: UIButton!
    @IBOutlet weak var wakingUpAtNightButton: UIButton!
    @IBOutlet weak var ADLButton: UIButton!
    @IBOutlet weak var difficultyTalkingButton: UIButton!
    @IBOutlet weak var difficultyWalkingButton: UIButton!
    @IBOutlet weak var noneNextButton: UIButton!
    
    lazy var sumOfIndices : Int = 0
    
    // transparent, green, orange, red
    var colourHexCodes: [String] = ["#FFFFFF00", "#00A752FF", "#FFC221FF", "#C51426FF"]
    
    var buttonColours: [UIColor] =
        [UIColor(red: 0, green: 0, blue: 0, alpha: 0),
         UIColor(red: 0, green: 167/255, blue: 82/255, alpha: 255/255),
         UIColor(red: 255/255, green: 194/255, blue: 33/255, alpha: 255/255),
         UIColor(red: 197/255, green: 20/255, blue: 38/255, alpha: 255/255)]
    
    var buttonTextColours: [UIColor] =
        [UIColor(red:(0/255.0), green:(113.0/255.0), blue:(255.0/255.0), alpha:1),
         UIColor.white,
         UIColor.black,
         UIColor.white]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        var shouldDisplayTutorial : Bool = false
        if let plist = Plist(name: "PatientData") {
            
            let dict = plist.getValuesInPlistFile()!
            
            shouldDisplayTutorial = !(dict.value(forKey: "hasSeenSymptomsTutorial") as! Bool)
            
        } else {
            print("Unable to get Plist")
        }
        
        if (shouldDisplayTutorial) {
            self.performSegue(withIdentifier: "symptomActionPlanTutorialPopover", sender: self)
        }
        // Do any additional setup after loading the view.
    }
    
    
    func addBlur() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //always fill the view
        blurEffectView.frame = self.view.bounds
        blurEffectView.alpha = 0.7
        blurEffectView.tag = 343
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(blurEffectView)
    }
    
    func removeBlur() {
        for subview in self.view.subviews {
            if (subview.tag == 343) {
                subview.removeFromSuperview()
                break
            }
        }
    }
    
    internal func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        if let plist = Plist(name: "PatientData") {
            let dict = plist.getMutablePlistFile()!
            dict["hasSeenSymptomsTutorial"] = true
            do {
                try plist.addValuesToPlistFile(dictionary: dict)
            } catch {
                print(error)
            }
            
        } else {
            print("Unable to get Plist")
        }
        removeBlur()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "symptomActionPlanTutorialPopover") {
            addBlur()
            let vc = segue.destination
            let controller = vc.popoverPresentationController
            controller?.delegate = self
            controller?.sourceView = self.view;
            controller?.permittedArrowDirections = UIPopoverArrowDirection(rawValue:0)
            controller?.sourceRect = CGRect(x: (self.view.bounds).midX, y: (self.view.bounds).midY, width: 0, height: 0)
        }
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
        let nextColourIndex : Int = (currentColourIndex + 1) % buttonColours.count
        sumOfIndices -= currentColourIndex
        sumOfIndices += nextColourIndex
        switchNoneNext()
        sender.titleLabel?.textColor = buttonTextColours[nextColourIndex]
        sender.backgroundColor = buttonColours[nextColourIndex]
    }
    
    
    @IBAction func switchColourOrange(_ sender: UIButton) {
        var nextColourIndex : Int = 0;
        
        if (sender.backgroundColor == nil || sender.backgroundColor!.isEqual(buttonColours[0])) {
            nextColourIndex = 2
            sumOfIndices += nextColourIndex
        } else {
            nextColourIndex = 0
            sumOfIndices -= 2
        }
        switchNoneNext()
        sender.titleLabel?.textColor = buttonTextColours[nextColourIndex]
        sender.backgroundColor = buttonColours[nextColourIndex]
    }
    
    
    @IBAction func switchColourRed(_ sender: UIButton) {
        var nextColourIndex : Int = 0;
        
        if (sender.backgroundColor == nil || sender.backgroundColor!.isEqual(buttonColours[0])) {
            nextColourIndex = 3
            sumOfIndices += nextColourIndex
        } else {
            nextColourIndex = 0
            sumOfIndices -= 3
        }
        switchNoneNext()
        sender.titleLabel?.textColor = buttonTextColours[nextColourIndex]
        sender.backgroundColor = buttonColours[nextColourIndex]
    }
    
    func switchNoneNext() {
        if (sumOfIndices == 0) {
            noneNextButton.setTitle("None", for: .normal)
            noneNextButton.setAttributedTitle(NSAttributedString.init(string: "None"), for: .normal)
        } else {
            noneNextButton.setTitle("Next", for: .normal)
            noneNextButton.setAttributedTitle(NSAttributedString.init(string: "Next"), for: .normal)
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
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
