//
//  MasterController.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/10/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

class MasterController: UITableViewController, UISplitViewControllerDelegate {
    
    private let TAG = "MasterController"
    
    private var collapseViewController: Bool = true
    
    /**

    */
    override func viewDidLoad() {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        super.viewDidLoad()
        
        splitViewController?.delegate = self
    }
    
    
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController!, ontoPrimaryViewController primaryViewController: UIViewController!) -> Bool {
        return collapseViewController
        
    }
    /**

    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        // identifier if required, if you have more then one segue
        // it could be set via IB, i did ...
        if segue.identifier == "show_detail_segue_id" {
            println("Break 1")
            // colorViewController should never be assigned to nil !!!
            var mapViewController: DetailController!
            
            // with help of adaptive segue we can support all devices
            if let mapNavigationController = segue.destinationViewController as? UINavigationController {
                println("Break 2")
                // works on devices where UISplitViewController is implemented
                mapViewController = mapNavigationController.topViewController as DetailController

                //mapViewController.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                //mapViewController.navigationItem.leftItemsSupplementBackButton = true
                
            } else {
                // works for iPhone on ios7, where UISplitViewController is not implemented
                mapViewController = segue.destinationViewController as DetailController
            }
            //splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.PrimaryHidden
            // Now we can configure the detail view controller however we wish
            
            splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.PrimaryHidden
        }
    }
    
}
