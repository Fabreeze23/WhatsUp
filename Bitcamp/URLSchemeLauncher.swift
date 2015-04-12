//
//  URLSchemeLauncher.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/11/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

class URLSchemeLauncher {
    
    private let TAG = "URLSchemeLauncher"
    
    class var sharedInstance: URLSchemeLauncher {
        struct Singleton {
            static let instance = URLSchemeLauncher()
        }
        return Singleton.instance;
    }
    
    var contactUrl: String = ""
    
    var goinOnUrl: String = ""
    
    
    func openContactProgram() {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        let url = NSURL(string: contactUrl)!
        if UIApplication.sharedApplication().canOpenURL(url) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    func openGoinOnProgram() {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        let url = NSURL(string: goinOnUrl)!
        if UIApplication.sharedApplication().canOpenURL(url) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
}