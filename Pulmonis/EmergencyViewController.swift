//
//  EmergencyViewController.swift
//  Pulmonis
//
//  Created by Seng, Sophie on 18/10/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class EmergencyViewController: UIViewController {

    

    @IBOutlet weak var headerLabel: UILabel!
    //@IBOutlet weak var bottomSentenceLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var sentenceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 10.0
        nextButton.clipsToBounds = true

        // Do any additional setup after loading the view.
        
        let blueColour = UIColor (red:(118.0/255.0), green:(213.0/255.0), blue:(255.0/255.0), alpha:1)
        
        let headerAttributedString = NSMutableAttributedString(string: "Use your blue inhaler")
        headerAttributedString.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFont(ofSize: headerLabel.font.pointSize), range: NSRange(location:9,length:4))
        headerAttributedString.addAttribute(NSBackgroundColorAttributeName, value: blueColour, range: NSRange(location:9,length:4))
        headerAttributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSRange(location:9,length:4))
        
        headerLabel.attributedText = headerAttributedString
        
        let sentenceAttributedString = NSMutableAttributedString(string: "Follow the instructions\nuntil you feel better")
        sentenceAttributedString.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFont(ofSize: sentenceLabel.font.pointSize), range: NSRange(location:34,length:11))
        sentenceLabel.attributedText = sentenceAttributedString
      
        let instructionAttributedString = NSMutableAttributedString(string: "Push inhaler and breathe in")
        instructionAttributedString.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFont(ofSize: instructionLabel.font.pointSize), range: NSRange(location:16,length:11))
        instructionLabel.attributedText = instructionAttributedString
        
        
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
