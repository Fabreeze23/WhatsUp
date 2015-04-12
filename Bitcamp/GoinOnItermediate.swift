//
//  GoinOnItermediate.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/11/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

class GoinOnIntermediate: UIViewController {
    
    private let TAG = "GoinOnIntermediate"
    
    private let INSTAGRAM_URL_SCHEME = "instagram://app"
    private let FACEBOOK_URL_SCHEME = "fb://feed"
    
    
    /**

    */
    @IBAction func instagramButtonPressed(sender: AnyObject) {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        URLSchemeLauncher.sharedInstance.goinOnUrl = INSTAGRAM_URL_SCHEME
        
        openViewController()
    }

    
    /**

    */
    @IBAction func facebookButtonPressed(sender: AnyObject) {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        URLSchemeLauncher.sharedInstance.goinOnUrl = FACEBOOK_URL_SCHEME
        
        openViewController()
    }
    
    
    /**

    */
    private func openViewController() {
        let vc = UIStoryboard(name: "GoinOn", bundle: nil).instantiateInitialViewController() as! UIViewController
        self.navigationController?.showViewController(vc, sender: self)

        navigationController?.viewControllers.removeAtIndex(navigationController!.viewControllers.endIndex - 2)
    }
}
