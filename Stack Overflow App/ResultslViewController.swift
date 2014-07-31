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
    //var items : NSArray = []
    var NC = NetworkController()
    var results = ["Please Search For Something"]
    
//    func setItemsCallback(JSONitems: NSArray) -> Void {
//        self.items = JSONitems
//        self.resultsTable.reloadData()
//    }
    
    func parseByType(type: String, JSONreply: NSDictionary) -> Void {
        self.results = []
        switch type {
            case "Search":
                if let items = JSONreply["items"] as? NSArray {
                    for item in items{
                        if let nowItsADictionary = item as? NSDictionary {
                            if let title = nowItsADictionary["title"] as? String{
                                self.results.append(title)
                            }
                        }
                    }
                }
            default:
                results = ["Error: No Results Returned"]
        }
        NSOperationQueue.mainQueue().addOperationWithBlock() {
            self.resultsTable.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar!) {
        NC.fetchJSONforItemType("Search", key: searchBar.text,callback: parseByType)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsTable.dataSource = self
        searchBar.delegate = self
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return results.count
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

