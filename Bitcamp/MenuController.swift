//
//  MasterController.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/10/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

import TwitterKit

class MenuViewController: UITableViewController {
    
    private let TAG = "MasterController"
    
    // the reuse identifier of the prototype cell to use for the table view
    private let EVENT_CELL_REUSE_IDENTIFIER: String = "EventCell"

    private let imageNames = ["alarm", "monthly calendar", "twitter", "users", "customer care f", "command"]
    
    private var items = ["Reminders", "Goin'On", "My World", "Followers", "Contact", "Settings"]
    

    private var collapseViewController: Bool = true
    
    
    /**

    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            EVENT_CELL_REUSE_IDENTIFIER) as! UITableViewCell
        
        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = UIImage(named: imageNames[indexPath.row])
        
        return cell
    }
    
    
    /**

    */
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    /**

    */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    /**

    */
    override func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath){
            
            switch items[indexPath.row] {
                
                case "Reminders":
                    var reminderBar = UIStoryboard(name: "Reminder", bundle: nil).instantiateViewControllerWithIdentifier("Reminder") as! ReminderViewController
                    self.navigationController!.showViewController(reminderBar, sender: self)
                    break
                case "Goin'On":
                    var vc: UIViewController
                    if URLSchemeLauncher.sharedInstance.goinOnUrl == "" {
                        vc = UIStoryboard(name: "GoinOnIntermediate", bundle: nil).instantiateInitialViewController() as! UIViewController
                    } else {
                        vc = UIStoryboard(name: "GoinOn", bundle: nil).instantiateInitialViewController() as! UIViewController
                    }
                    self.navigationController?.showViewController(vc, sender: self)
                    break
                case "My World":
                    var myWorld = MyWorldTimelineController()
                    myWorld.view.frame = view.frame
                    self.navigationController?.showViewController(myWorld, sender: self)
                case "Followers":
                    var vc = UIStoryboard(name: "Followers", bundle: nil).instantiateInitialViewController() as! UIViewController
                    navigationController?.showViewController(vc, sender: self)
                    break
                case "Contact":
                    var vc: UIViewController
                    if URLSchemeLauncher.sharedInstance.contactUrl == "" {
                        vc = UIStoryboard(name: "ContactIntermediate", bundle: nil).instantiateInitialViewController() as! UIViewController
                    } else  {
                        vc = UIStoryboard(name: "Contact", bundle: nil).instantiateInitialViewController() as! UIViewController
                    }
                    self.navigationController?.showViewController(vc, sender: nil)
                    break
                case "Settings":
                    let vc = UIStoryboard(name: "Settings", bundle: nil).instantiateInitialViewController() as! UIViewController
                    
                    navigationController?.showViewController(vc, sender: self)
                    break
                
                default:
                    println("Could not open Page")
            }
            
            /**
            if indexPath.row == 0 {
            var reminderBar = UIStoryboard(name: "Reminder", bundle: nil).instantiateViewControllerWithIdentifier("Reminder") as! ReminderViewController
            self.navigationController!.showViewController(reminderBar, sender: self)
            } else if indexPath.row == 1 {
                var vc: UIViewController
                if URLSchemeLauncher.sharedInstance.goinOnUrl == "" {
                    vc = UIStoryboard(name: "GoinOnIntermediate", bundle: nil).instantiateInitialViewController() as! UIViewController
                } else {
                    vc = UIStoryboard(name: "GoinOn", bundle: nil).instantiateInitialViewController() as! UIViewController
                }
                self.navigationController?.showViewController(vc, sender: self)
            }else if indexPath.row == 2 {
                var followers = MyWorldTimelineController()
                followers.view.frame = view.frame
                self.navigationController?.showViewController(followers, sender: self)
            }
            
            else if indexPath.row == 3 {
                var vc: UIViewController
                if URLSchemeLauncher.sharedInstance.contactUrl == "" {
                    vc = UIStoryboard(name: "ContactIntermediate", bundle: nil).instantiateInitialViewController() as! UIViewController
                } else  {
                    vc = UIStoryboard(name: "Contact", bundle: nil).instantiateInitialViewController() as! UIViewController
                }
                self.navigationController?.showViewController(vc, sender: nil)
            } else if indexPath.row == 4 {
                let vc = UIStoryboard(name: "Settings", bundle: nil).instantiateInitialViewController() as! UIViewController
                
                navigationController?.showViewController(vc, sender: self)
            }
*/
            
    }
    
    
    
    /**

    */
    override func viewDidLoad() {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        super.viewDidLoad()
        
        
    }
    
}
