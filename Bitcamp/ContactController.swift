//
//  ContactController.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/11/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

class ContactController: UIViewController {
    
    private let TAG = "ContactController"
    
    @IBAction func launchPressed(sender: AnyObject) {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        URLSchemeLauncher.sharedInstance.openContactProgram()
    }
    
}