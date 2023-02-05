//
//  DateFormat.swift
//  Hospital
//
//  Created by nang saw on 05/02/2023.
//

import Foundation

class DateFormatHelper {
    class func stringToDate(date: String) -> Date{
        if date != ""{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            let d = dateFormatter.date(from:date)!
            return d
        }else{
            return Date()
        }
    }
    
    class func dateToString(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let tempString = dateFormatter.string(from: date)
        return tempString
    }
}
