//
//  Reminder.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/11/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

class Reminder {
    
    var text: String
    
    var timeToSend: NSDate
    
    init(text: String, timeToSend: NSDate) {
        self.text = text
        self.timeToSend = timeToSend
    }
}