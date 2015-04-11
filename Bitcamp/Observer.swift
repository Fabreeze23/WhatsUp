//
//  Observer.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/10/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

import Foundation

class Observer: NSObject {
    
    private let TAG = "Observer"
    
    // The callback closure to call when a change is observed
    private let callback: ()->Void
    private let observee: NSObject
    private let keyPath: String
    
    
    /**
    
    
    */
    private init(observee: NSObject, keyPath: String, callback: ()->Void) {
        self.callback = callback
        self.keyPath = keyPath
        self.observee = observee
    }
    
    deinit {
        Logger.log(TAG, message: "de-initializing")
        observee.removeObserver(self, forKeyPath: keyPath)
    }
    
    
    /**
    
    */
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        Logger.log(TAG, message: "observerKeyChange: \(keyPath), \(change)")
        self.callback()
    }
    
    
    /**
    Class function which registers a key-value observer relationship between an object, and a
    property of another object. In most cases within this application, the relationship will
    be between a view controller, and the properties of a model. Whenever a change is observed
    in the property, the provided callback closure is called
    
    :param: object      The object to register as an observer
    :param: keyPath     the name of the property to observe, as a String
    :param: callback    The closure to call when a change is observed
    
    :returns:   An instance of the observer object created with the provided data. An instance
    should be held in the caller class
    */
    class func observe(object: NSObject, keyPath: String, callback: ()->Void) -> Observer {
        let observer = Observer(observee: object, keyPath: keyPath, callback: callback)
        object.addObserver(observer, forKeyPath: keyPath, options: NSKeyValueObservingOptions.New, context: nil)
        return observer
    }
    
}
