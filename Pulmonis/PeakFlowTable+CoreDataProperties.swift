//
//  PeakFlowTable+CoreDataProperties.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 01/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import Foundation
import CoreData


extension PeakFlowTable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PeakFlowTable> {
        return NSFetchRequest<PeakFlowTable>(entityName: "PeakFlowTable");
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var value: Int16

}
