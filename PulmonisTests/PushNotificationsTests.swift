//
//  PushNotificationsTests.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 03/01/2017.
//  Copyright © 2017 Manivannan Solan. All rights reserved.
//

import XCTest
import UserNotifications

@testable import Pulmonis



class PushNotificationsTests: XCTestCase {
    
    class MockUserNotificationCenter : PushNotificationCenter {
        
        var pendingRequests : [UNNotificationRequest] = []
        
        override func addNotification(_ request: UNNotificationRequest, withCompletionHandler completionHandler: ((Error?) -> Void)? = nil) {
            pendingRequests.append(request)
        }
        
        override func removeNotification(identifiers: [String]) {
            var index = -1
            for i in 0..<pendingRequests.count {
                if pendingRequests[i].identifier == identifiers[0] {
                    index = i
                }
            }
            if index != -1 {
                pendingRequests.remove(at: index)
            }
        }
    }
    
    var rvc : ReminderTableViewCell? = nil
    var notificationCenter = MockUserNotificationCenter()
    
    override func setUp() {
        super.setUp()
        rvc = ReminderTableViewCell()
        rvc?.setNotificationCenter(center: notificationCenter)
        rvc?.setReminderType(type: "morning")
        rvc?.setPuffType(type: gPuffsMorningStr)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    func testAddingAndRemovingSameNotification() {
        rvc?.addPendingNotification()
        XCTAssert(notificationCenter.pendingRequests.count == 1, "Should have one pending notification")
        rvc?.removePendingNotification()
        XCTAssert(notificationCenter.pendingRequests.count == 0, "Notification should have been removed")
    }
    
}
