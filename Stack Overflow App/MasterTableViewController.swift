//
//  MasterTableViewController.swift
//  Stack Overflow App
//
//  Created by Alex on 7/30/14.
//  Copyright (c) 2014 Alex Rice. All rights reserved.
//

import UIKit

class MasterTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var masterTableView: UITableView!
    
    var menu = [ ["title":"Search By Keyword", "endpoint":"http://api.stackexchange.com/2.2/search?order=desc&sort=activity&site=stackoverflow&intitle="], ["title":"Search By Tag", "endpoint":"http://api.stackexchange.com/2.2/search?order=desc&sort=activity&site=stackoverflow&tagged="]]

    override func viewDidLoad() {
        super.viewDidLoad()
        println("master view controller loaded")
        masterTableView.dataSource = self

        NSUserDefaults.standardUserDefaults().synchronize()
        if let beenHere = NSUserDefaults.standardUserDefaults().valueForKey("newUser") as? Bool {
            println("not a new user")
        } else{
            println("new user")
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "newUser")
            NSUserDefaults.standardUserDefaults().synchronize()
            println("Wrote to NSUserDefaults")
        }

    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return menu.count
    }

    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell", forIndexPath: indexPath) as CustomTableViewCell
        //cell.textLabel.text = "CRASH"
        cell.textLabel.text = (menu[indexPath.row] as Dictionary )["title"]
        //cell.textLabel.text = "By Tag"

        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        let newVC = self.storyboard.instantiateViewControllerWithIdentifier("ResultsViewController") as ResultsViewController
        newVC.endpoint = (menu[indexPath.row] as Dictionary )["endpoint"]
        newVC.typeOfSearch = (menu[indexPath.row] as Dictionary )["title"]
        self.splitViewController.showDetailViewController(newVC, sender: self)
    }

}
