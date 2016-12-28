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
        if(pListVal){
            //want to turn off
            let eveningNotification = ["eveningNotification"]
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: eveningNotification)
            pListVal = false
        } else {
            
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
            pListVal = true
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
