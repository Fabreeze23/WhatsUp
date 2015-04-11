//
//  LoginPageController.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/11/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

import TwitterKit

class LoginPageController: UIViewController {
    
    private let TAG = "LoginPageController"
    
    private var viewController: UIViewController?
    
    
    /**

    */
    override func viewDidLoad() {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        let storyboard = UIStoryboard(name: "App", bundle: nil)
        viewController = storyboard.instantiateInitialViewController()
            
         as? UIViewController
        view.frame = view.frame
        view.backgroundColor = UIColor.cyanColor()
        
        let logInButton = TWTRLogInButton(logInCompletion:
            { (session, error) in
                if (session != nil) {
                    println("signed in as \(session.userName)");
                    UIView.transitionFromView(
                        self.view,
                        toView: self.viewController!.view,
                        duration: 0.5,
                        options: UIViewAnimationOptions.TransitionFlipFromLeft,
                        completion: nil
                    )
                } else {
                    println("error: \(error.localizedDescription)");
                }
        })
        
        logInButton.center = self.view.center
        view.addSubview(logInButton)

    }
}