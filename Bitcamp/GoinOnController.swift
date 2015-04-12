//
//  GoinOnController.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/11/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

class GoinOnController: UIViewController {
    
    private let TAG = "GoinOnController"
    
    @IBAction func launchPressed(sender: AnyObject) {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        URLSchemeLauncher.sharedInstance.openGoinOnProgram()
    }
    

}
