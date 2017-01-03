//
//  ReminderTableViewCell.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 03/01/2017.
//  Copyright © 2017 Manivannan Solan. All rights reserved.
//

import UIKit
import UserNotifications

class ReminderTableViewCell: UITableViewCell {

    @IBOutlet weak var reminderTitle: UILabel!
    
    @IBOutlet weak var reminderSubTitle: UILabel!
    
    @IBOutlet weak var reminderSwitch: UISwitch!
    
    var reminderType = ""
    var reminderIdentifier = ""
    var puffType = ""
    var notificationCenter = PushNotificationCenter()
    
    public func setNotificationCenter(center: PushNotificationCenter) {
        notificationCenter = center
    }
    
    func setReminderTitle(title: String) {
        reminderTitle.text = title
    }
    
    func setReminderSubTitle(subtitle: String) {
        reminderSubTitle.text = subtitle
    }
    
    func setReminderType(type: String) {
        reminderType = type
        reminderIdentifier = reminderType + "Notification"
    }
    
    func setPuffType(type: String) {
        puffType = type
    }
    
    func setMorningSwitch() {
        if let plist = Plist(name: "Reminders") {
            let dict = plist.getMutablePlistFile()!
            
            if let ReminderInfo = (dict[reminderType]! as? [Any]) {
                if ReminderInfo.count != 0 {
                    if let switchVal = ReminderInfo[1] as? Bool {
                        reminderSwitch.setOn(switchVal, animated: false)
                    }
                } else {
                    print("[DEBUG] reminderInfo in pList is empty")
                }
            } else {
                print("[DEBUG] Wrong reminder type couldn't find in plist \(reminderType)")
            }
        } else {
            print("[DEBUG] Error: Couldn't open plist")
        }
    }
    
    func getReminderSubTitle() -> String {
        if let plist = Plist(name: "PatientData") {
            let dict = plist.getMutablePlistFile()!
            
            if let Puffs = (dict[puffType]! as? String) {
                return Puffs
            } else {
                print("[DEBUG] Couldn't find \(puffType) in plist")
            }
        } else {
            print("[DEBUG] Couldn't open plist")
        }
        return ""
    }
    
    func setReminderSubTitleForPuffs() {
        let puffs = getReminderSubTitle()
        if puffs == "" {
            setReminderSubTitle(subtitle: "No record in doctor's input.")
        } else {
            setReminderSubTitle(subtitle: "\(puffs) puffs every \(reminderType)")
        }
    }
    
    func removePendingNotification() {
        let notificationArray = [reminderIdentifier]
        notificationCenter.removeNotification(identifiers: notificationArray)
    }
    
    func addPendingNotification() {
        let calendar = Calendar(identifier: .gregorian)
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, second: 0)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: true)
        
        let content = UNMutableNotificationContent()
        content.title = "\(reminderType.capitalizingFirstLetter()) Asthma Reminder"
        content.body = ""
        if let subtitle = reminderSubTitle {
            if let body = subtitle.text {
                content.body = body
            }
        }
        content.sound = UNNotificationSound.default()
        
        let request = UNNotificationRequest(identifier: reminderIdentifier, content: content, trigger: trigger)
        
        notificationCenter.addNotification(request) {(error) in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
        }

    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if let plist = Plist(name: "Reminders") {
            let dict = plist.getMutablePlistFile()!
            let reminderInfo = dict[reminderType]! as? [Any]
            if (reminderInfo?.count != 0 && (reminderInfo?[1] as? Bool)!) {
                removePendingNotification()
                dict[reminderType] = ["9am date", false]
                print("[DEBUG] Turning off \(reminderType)")
            } else {
                addPendingNotification()
                dict[reminderType] = ["9am date", true]
                print("[DEBUG] Turning on \(reminderType)")
            }
            do {
                try plist.addValuesToPlistFile(dictionary: dict)
            } catch {
                print(error)
            }
        }
    }
    
    func setUpCell() {
        setMorningSwitch()
        setReminderTitle(title: "\(reminderType.capitalizingFirstLetter()) reminder")
        setReminderSubTitleForPuffs()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
