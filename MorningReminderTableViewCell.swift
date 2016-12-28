//
//  MorningReminderTableViewCell.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 28/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit
import UserNotifications

class MorningReminderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var morningSwitch: UISwitch!
    @IBOutlet weak var dosageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //create flag in plist to know whether switch is on or not
        
        
        if let plist = Plist(name: "PatientData") {
            let dict = plist.getMutablePlistFile()!
            
            if let morningPuffs = (dict[gPuffsMorningStr]! as? String) {
                if morningPuffs != "" {
                    dosageLabel.text = morningPuffs + " every morning at 9AM."
                } else {
                    dosageLabel.text = "No record in doctor's input."
                }
            } else {
                dosageLabel.text = "No record in doctor's input."
            }
        } else {
            //Error with opening the PList
        }

        
        
        
    }
    
    var pListVal = false
    
    
    @IBAction func morningReminderSwitchChanged(_ sender: UISwitch) {
        //pull orignal plist vlaue and then change appropriately
        
        if(pListVal){
            //want to turn off
            let morningNotification = ["morningNotification"]
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: morningNotification)
            pListVal = false
        } else {
            var puffs = ""
            
            if let plist = Plist(name: "PatientData") {
                let dict = plist.getMutablePlistFile()!
                
                if let morningPuffs = (dict[gPuffsMorningStr]! as? String) {
                    puffs = morningPuffs
                }
            } else {
                //Error with opening the PList
            }
            let calendar = Calendar(identifier: .gregorian)
            let newComponents = DateComponents(calendar: calendar, timeZone: .current, second: 0)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: true)
            
            let content = UNMutableNotificationContent()
            content.title = "Morning Asthma Reminder"
            content.body = "Please remember to take \(puffs) puffs of your preventer inhaler this morning"
            content.sound = UNNotificationSound.default()
            
            let request = UNNotificationRequest(identifier: "morningNotification", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) {(error) in
                if let error = error {
                    print("Uh oh! We had an error: \(error)")
                }
            }
            pListVal = true
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
