//
//  Logger.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/11/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

import Foundation


class Logger {
    
    class func log(tag: String, message: String) {
        var spaces: String = ""
        for index in 0...(50 - tag.utf16Count) {
            spaces += " "
        }
        println("\(tag):\(spaces)\t\(message)")
    }
}
