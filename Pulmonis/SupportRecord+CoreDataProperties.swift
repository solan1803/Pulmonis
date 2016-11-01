//
//  SupportRecord+CoreDataProperties.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 01/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import Foundation
import CoreData


extension SupportRecord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SupportRecord> {
        return NSFetchRequest<SupportRecord>(entityName: "SupportRecord");
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var value: Int16

}
