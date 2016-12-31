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
        
        if let plist = Plist(name: "Reminders") {
            let dict = plist.getMutablePlistFile()!
            
            if let morningReminderInfo = (dict["morning"]! as? [Any]) {
                if morningReminderInfo.count != 0 {
                    if let switchVal = morningReminderInfo[1] as? Bool {
                        morningSwitch.setOn(switchVal, animated: false)
                    }
                }
            }
        } else {
            //Error with opening the PList
        }

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
    
    
    @IBAction func morningReminderSwitchChanged(_ sender: UISwitch) {
        //pull orignal plist vlaue and then change appropriately
        if let plist = Plist(name: "Reminders") {
            
            let dict = plist.getMutablePlistFile()!
            let morningInfo = dict["morning"]! as? [Any]
            if(morningInfo?.count != 0 && (morningInfo?[1] as? Bool)!){
                print("[DEBUG] Attempting to set morning reminder to off in plist")
                let morningNotification = ["morningNotification"]
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: morningNotification)
                
                
                
                dict["morning"] = ["9am date", false]
                do {
                    try plist.addValuesToPlistFile(dictionary: dict)
                } catch {
                    print(error)
                }
                
            } else {
                print("[DEBUG] Attempting to set morning reminder to on in plist.")
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
                dict["morning"] = ["9am date", true]
                do {
                    try plist.addValuesToPlistFile(dictionary: dict)
                } catch {
                    print(error)
                }
                
            }
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
