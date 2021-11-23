//
//  Notification.swift
//  Gleak
//
//  Created by Swamita Gupta on 23/11/21.
//

import Foundation

struct Notification {
    let title: String
    let message: String
    let time: Int
    
    func toTime() -> String{
        var epocTime = TimeInterval(time)
        let myDate = NSDate(timeIntervalSince1970: epocTime)
        return myDate.toString(dateFormat: "MMM-dd HH:mm")
    }
}

extension NSDate
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self as Date)
    }

}
