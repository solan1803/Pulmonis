//
//  PushNotificationsViewController.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 27/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit
import UserNotifications

class PushNotificationsViewController: UIViewController {
    
    @IBAction func addReminderNotification(_ sender: UIButton) {
        
        let selectedDate = Date().addingTimeInterval(120)
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.scheduleNotification(at: selectedDate)
        
    }
    @IBAction func deleteAllNotifications(_ sender: UIButton) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
