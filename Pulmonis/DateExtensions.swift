//
//  DateExtensions.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 04/01/2017.
//  Copyright © 2017 Manivannan Solan. All rights reserved.
//

import Foundation
extension NSDate {
    func isGreaterThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
}
