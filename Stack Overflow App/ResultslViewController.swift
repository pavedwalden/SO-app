//
//  ViewController.swift
//  Stack Overflow App
//
//  Created by Alex on 7/28/14.
//  Copyright (c) 2014 Alex Rice. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UISearchBarDelegate,UITableViewDataSource {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultsTable: UITableView!
    
    var endpoint : String?
    var items : NSArray = []
    var NC = NetworkController()
    var results = ["~~ Search for somethin' ~~"]
    
    func setItemsCallback(JSONitems: NSArray) -> Void {
        self.items = JSONitems
        self.resultsTable.reloadData()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar!) {
        NC.fetchJSONforSearchByTag(byTag: searchBar.text, callback: setItemsCallback )
    }
    
    @IBAction func searchButton(sender: AnyObject) {
        //NC.fetchJSONforSearchByTag(byTag: searchBar.text, callback: setItemsCallback)
        println("searched")
    }
    
    @IBAction func printIt(sender: AnyObject) {
        //println(self.items)
        for question in items {
            println(question["title"])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsTable.dataSource = self
        searchBar.delegate = self
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 1
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("resultCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel.text = results[indexPath.row]
        
        return cell
    }

    //
    //    @IBAction func button(sender: AnyObject) {
    //        //NC.fetchJSONforItemType("User", byId: "135152")
    //        NC.fetchJSONforItemType("Question", byId: "1343344", callback: setItemsCallback)
    //        //NC.fetchJSONforItemType("Answer", byId: "4101761")
    //    }

}

