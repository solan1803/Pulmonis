//
//  StringExtensions.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 03/01/2017.
//  Copyright © 2017 Manivannan Solan. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
