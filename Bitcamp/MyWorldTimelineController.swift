//
//  FollowersTimelineController.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/12/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

import UIKit
import TwitterKit

class MyWorldTimelineController: TWTRTimelineViewController {

    private let TAG = "FollowersTimelineController"
    
    
    /**

    */
    convenience init() {
        let client = Twitter.sharedInstance().APIClient
        
        let session = Twitter.sharedInstance().session()
        
        let screenName = session.userName
        let dataSource = TWTRUserTimelineDataSource(screenName: screenName, APIClient: client)
        
        TwitterModel.sharedInstance.loadTweets()
        self.init(dataSource: dataSource)
    }
    
    
    /**

    */
    override required init(dataSource: TWTRTimelineDataSource) {
        super.init(dataSource: dataSource)
    }
    
    
    /**

    */
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}