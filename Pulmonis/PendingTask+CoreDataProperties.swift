//
//  PendingTask+CoreDataProperties.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 01/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import Foundation
import CoreData


extension PendingTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PendingTask> {
        return NSFetchRequest<PendingTask>(entityName: "PendingTask");
    }

    @NSManaged public var message: String?
    @NSManaged public var date_created: NSDate?
    @NSManaged public var reminder_time: NSDate?
    @NSManaged public var type: String?

}
