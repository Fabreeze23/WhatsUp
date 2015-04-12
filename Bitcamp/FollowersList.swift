//
//  FollowersList.swift
//  Bitcamp
//
//  Created by Fabrice Mulumba on 4/12/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

import Foundation
import TwitterKit


class FollowersList: UITableViewController {
    
    private let EVENT_CELL_REUSE_IDENTIFIER: String = "EventCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TwitterModel.sharedInstance.loadTweets()
        //TwitterModel.sharedInstance.loadLocation()
    }
    
    override func viewWillAppear(animated: Bool) {
        TwitterModel.sharedInstance.tableView = tableView
        TwitterModel.sharedInstance.loadTweets()
        TwitterModel.sharedInstance.loadLocation()
        
    }
    
    
    /**

    */
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    /**

    */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TwitterModel.sharedInstance.followerNames.count
    }
    
    
    /**

    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FollowerCell") as! UITableViewCell
        
        cell.textLabel!.text = TwitterModel.sharedInstance.followerNames[indexPath.row] as String

        return cell
    }

    
    /**

    */
    func twitterHelper() {
        let statusesShowEndpoint = "https://api.twitter.com/1.1/followers/list.json"
        
        var clientError : NSError?
        
        let request = Twitter.sharedInstance().APIClient.URLRequestWithMethod("GET", URL: statusesShowEndpoint, parameters: nil,error: &clientError)
        if request != nil {
            Twitter.sharedInstance().APIClient.sendTwitterRequest(request) {
                    (response, data, connectionError) -> Void in
                    if (connectionError == nil) {
                        var jsonError : NSError?
                        let json : AnyObject! =
                        NSJSONSerialization.JSONObjectWithData(data,
                            options: nil,
                            error: &jsonError)
                        let users = json["users"] as! NSArray
                        
                        var followerNames = [NSString]()
                        
                        for user in users {
                            let name = user["name"] as! NSString
                            followerNames.append(name)
                        }
                        println(followerNames)
                    }
                    else {
                        println("Error: \(connectionError)")
                    }
            }
        }
            
            
        else {
            println("Error: \(clientError)")
        }
        
    }
}