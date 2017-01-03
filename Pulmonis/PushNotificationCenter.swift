//
//  NotificationCenter.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 03/01/2017.
//  Copyright © 2017 Manivannan Solan. All rights reserved.
//

import Foundation
import UserNotifications

class PushNotificationCenter {
    
    var delegate = UNUserNotificationCenter.current()
    
    func addNotification(_ request: UNNotificationRequest, withCompletionHandler completionHandler: ((Error?) -> Void)? = nil) {
        delegate.add(request, withCompletionHandler: completionHandler)
    }
    
    func removeNotification(identifiers: [String]) {
        delegate.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
}
