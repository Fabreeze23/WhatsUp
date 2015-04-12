//
//  TwitterModel.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/12/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

import TwitterKit

class TwitterModel {
    
    private let TAG = "TwitterModel"
    
    
    
    class var sharedInstance: TwitterModel {
        struct Singleton {
            static let instance = TwitterModel()
        }
        return Singleton.instance;
    }
    
    var followerNames = [NSString]() {
        didSet {
            tableView?.reloadData()
        }
    }
    
    private var location: CLLocation?
    
    
    var tableView: UITableView?
    
    
    /**

    */
    func loadTweets() {
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
                    self.followerNames = followerNames
                    println(self.followerNames)
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
    
    func loadLocation() {
        
    }
    
}