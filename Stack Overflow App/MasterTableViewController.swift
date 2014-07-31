//
//  MasterTableViewController.swift
//  Stack Overflow App
//
//  Created by Alex on 7/30/14.
//  Copyright (c) 2014 Alex Rice. All rights reserved.
//

import UIKit

class MasterTableViewController: UIViewController, UITableViewDataSource {
    @IBOutlet var masterTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        println("master view controller loaded")
        masterTableView.dataSource = self
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
        return 1
    }

    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel.text = "By Tag"

        return cell
    }
   

}
