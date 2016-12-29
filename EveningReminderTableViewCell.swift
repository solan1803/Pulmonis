//
//  EveningReminderTableViewCell.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 28/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit
import UserNotifications

class EveningReminderTableViewCell: UITableViewCell {

    @IBOutlet weak var dosageLabel: UILabel!
    
    @IBOutlet weak var eveningSwitch: UISwitch!
    
    var pListVal = false
    
    @IBAction func eveningReminderSwitchChanged(_ sender: UISwitch) {
        
        if let plist = Plist(name: "Reminders") {
            
            let dict = plist.getMutablePlistFile()!
            let eveningInfo = dict["evening"]! as? [Any]
            if(eveningInfo?.count != 0 && (eveningInfo?[1] as? Bool)!){
                print("[DEBUG] Attempting to set evening reminder to off in plist")
                let eveningNotification = ["eveningNotification"]
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: eveningNotification)
                
                dict["evening"] = ["6pm date", false]
                do {
                    try plist.addValuesToPlistFile(dictionary: dict)
                } catch {
                    print(error)
                }
            } else {
                print("[DEBUG] Attempting to set evening reminder to on in plist.")
                var puffs = ""
                
                if let plist = Plist(name: "PatientData") {
                    let dict = plist.getMutablePlistFile()!
                    
                    if let eveningPuffs = (dict[gPuffsNightStr]! as? String) {
                        puffs = eveningPuffs
                    }
                } else {
                    //Error with opening the PList
                }
                
                
                let calendar = Calendar(identifier: .gregorian)
                let newComponents = DateComponents(calendar: calendar, timeZone: .current, second: 0)
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: true)
                
                let content = UNMutableNotificationContent()
                content.title = "Evening Asthma Reminder"
                content.body = "Please remember to take \(puffs) puffs of your preventer inhaler this evening"
                content.sound = UNNotificationSound.default()
                
                let request = UNNotificationRequest(identifier: "eveningNotification", content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request) {(error) in
                    if let error = error {
                        print("Uh oh! We had an error: \(error)")
                    }
                }
                
                dict["evening"] = ["6pm date", true]
                do {
                    try plist.addValuesToPlistFile(dictionary: dict)
                } catch {
                    print(error)
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let plist = Plist(name: "Reminders") {
            let dict = plist.getMutablePlistFile()!
            
            if let eveningReminderInfo = (dict["evening"]! as? [Any]) {
                if eveningReminderInfo.count != 0 {
                    if let switchVal = eveningReminderInfo[1] as? Bool {
                        eveningSwitch.setOn(switchVal, animated: false)
                    }
                }
            }
        } else {
            //Error with opening the PList
        }
        
        if let plist = Plist(name: "PatientData") {
            let dict = plist.getMutablePlistFile()!
            
            if let eveningPuffs = (dict[gPuffsNightStr]! as? String) {
                if eveningPuffs != "" {
                    dosageLabel.text = eveningPuffs + " every evening at 6PM."
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
