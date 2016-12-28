//
//  EveningReminderTableViewCell.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 28/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class EveningReminderTableViewCell: UITableViewCell {

    @IBOutlet weak var dosageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if let plist = Plist(name: "PatientData") {
            let dict = plist.getMutablePlistFile()!
            
            if let eveningPuffs = (dict[gPuffsNightStr]! as? String) {
                if eveningPuffs != "" {
                    dosageLabel.text = eveningPuffs + " every morning at 6PM."
                } else {
                    dosageLabel.text = "No record in doctor's input."
                }
            }
        } else {
            //Error with opening the PList
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
