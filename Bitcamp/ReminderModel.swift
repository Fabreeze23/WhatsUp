//
//  ReminderModel.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/11/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

class ReminderModel: NSObject {
    
    
    class var sharedInstance: ReminderModel {
        struct Singleton {
            static let instance = ReminderModel()
        }
        return Singleton.instance;
    }
    
    var reminders = [Reminder]()
    
    
    
}