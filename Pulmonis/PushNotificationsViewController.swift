//
//  PushNotificationsViewController.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 27/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit
import UserNotifications
import CoreData

class PushNotificationsViewController: UIViewController {
    
    var managedObjectContext: NSManagedObjectContext? =
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBAction func addReminderNotification(_ sender: UIButton) {
        
        let selectedDate = Date().addingTimeInterval(120)
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.scheduleNotification(at: selectedDate)
        
    }
    @IBAction func deleteAllNotifications(_ sender: UIButton) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    @IBAction func addPeakFlowRecord(_ sender: UIButton) {
        if let record = NSEntityDescription.insertNewObject(forEntityName: "PeakFlowTable", into: managedObjectContext!) as? PeakFlowTable {
            record.date = NSDate()
            record.value = Int16(300)
        }
        do {
            try managedObjectContext?.save()
        } catch let error {
            print(error)
        }
    }
}
