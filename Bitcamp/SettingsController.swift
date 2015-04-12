//
//  SettingsController.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/11/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

class SettingsController: UIViewController {
    
    @IBAction func resetPressed(sender: AnyObject) {
        URLSchemeLauncher.sharedInstance.contactUrl = ""
        URLSchemeLauncher.sharedInstance.goinOnUrl = ""
    }
    
    
}