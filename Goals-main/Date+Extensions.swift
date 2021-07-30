//
//  Date+Extensions.swift
//  Goals
//
//  Created by Kody Deda \ Ethan Cook on 7/20/21.
//

import Foundation

extension Date {
    var formattedDescription: String {
        DateFormatter.localizedString(
            from: self,
            dateStyle: .medium,
            timeStyle: .none
        )
    }
    
    var formattedDescriptionWeekday: String {
        DateFormatter.localizedString(
            from: self,
            dateStyle: .full,
            timeStyle: .none
        )
    }
    
}
