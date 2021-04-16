//
//  Date.swift
//  Reddit_Clone
//
//  Created by Kemal Ekren on 16.04.2021.
//

import Foundation

extension Date {
    
    func readableDate() -> String {
        
        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour], from: self, to: Date())
        
        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + "year" :
                "\(year)" +  "years"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + "month" :
                "\(month)" + "months"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + "d" :
                "\(day)" + " " + "d"
        } else if let hour = interval.hour, hour > 1 {
            return hour == 1 ? "\(hour)" + "h" :
                "\(hour)" + "h"
        }else {
            return "Now"
        }
    }
}
