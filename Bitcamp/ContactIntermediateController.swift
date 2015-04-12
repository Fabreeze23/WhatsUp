//
//  ContactIntermediateController.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/11/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

class ContactIntermediateController: UIViewController {
    
    private let TAG = "ContactIntermediateController"
    
    private let FACETIME_URL_SCHEME = "facetime:"
    private let MESSAGE_URL_SCHEME = "sms:"
    
    @IBAction func phoneButtonPressed(sender: AnyObject) {
        //phoneButton is FaceTime
        Logger.log(TAG, message: "\(__FUNCTION__)")
        
        URLSchemeLauncher.sharedInstance.contactUrl = FACETIME_URL_SCHEME
        
        openViewController()
    }
    
    @IBAction func messageButtonPressed(sender: AnyObject) {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        
        URLSchemeLauncher.sharedInstance.contactUrl = MESSAGE_URL_SCHEME
        
        openViewController()
    }
    
    private func openViewController() {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        
        let vc = UIStoryboard(name: "Contact", bundle: nil).instantiateInitialViewController() as! UIViewController

        navigationController?.showViewController(vc, sender: self)
        
        navigationController?.viewControllers.removeAtIndex(navigationController!.viewControllers.endIndex - 2)
    }

}
