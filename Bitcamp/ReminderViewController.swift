//
//  ReminderViewController.swift
//  Bitcamp
//
//  Created by Fabrice Mulumba on 4/11/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

import Foundation
import UIKit

class ReminderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let TAG = "ReminderViewController"
    
    @IBOutlet weak var openInstagramButton: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var text: UITextField!
    
    
    /**

    */
    override func viewDidLoad() {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.layer.borderColor = UIColor.grayColor().CGColor
        tableView.layer.borderWidth = 1.0
        
        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
    }
    
    
    /**

    */
    @IBAction func addReminderButtonPressed(sender: AnyObject) {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        let date = datePicker.date
        let reminderText = text.text
        ReminderModel.sharedInstance.reminders.append(Reminder(text: reminderText, timeToSend: date))
        tableView.reloadData()
    }
    
    
    /**

    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    /**

    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReminderModel.sharedInstance.reminders.count
    }
    
    
    /**

    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReminderCell") as! UITableViewCell
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.FullStyle
        
        cell.textLabel?.text = ReminderModel.sharedInstance.reminders[indexPath.row].text
        cell.detailTextLabel?.text = formatter.stringFromDate(ReminderModel.sharedInstance.reminders[indexPath.row].timeToSend)
        
        return cell
    }
    
    
    /**

    */
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsetsZero
    }
    
    
    /**

    */
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    /**

    */
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            ReminderModel.sharedInstance.reminders.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }

}