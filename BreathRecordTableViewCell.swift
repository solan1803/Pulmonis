//
//  BreathRecordTableViewCell.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 29/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class BreathRecordTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var recordImage: UIImageView!
    
    func setDate(setDate: Date) {
        dateLabel.text = setDate.description
    }
    
    func setValue(value: Int, inhaler: Bool) {
        let v = String(value)
        if inhaler {
            valueLabel.text = v + " puffs"
        } else {
            valueLabel.text = v + " L/min"
        }
    }
    
    func setImage(inhaler: Bool) {
        if inhaler {
            recordImage.image = UIImage(named: "Inhaler")
        } else {
            recordImage.image = UIImage(named: "PeakFlowMeter")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
