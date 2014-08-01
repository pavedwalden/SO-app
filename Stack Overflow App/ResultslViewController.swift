//
//  ViewController.swift
//  Stack Overflow App
//
//  Created by Alex on 7/28/14.
//  Copyright (c) 2014 Alex Rice. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var resultsTable: UITableView!
    @IBOutlet weak var detailSearchBar: UISearchBar!
    
    
    var endpoint : String?
    var NC = NetworkController()
    var results : [AnyObject] = [["title":"","link":""]]
    var typeOfSearch : String?
    
    func parseByType(type: String, JSONreply: NSDictionary) -> Void {
        println("Callback started")
        self.results = []
        var returnItem : Dictionary<String, String> = [:]
        switch type {
            case "Search By Keyword", "Search By Tag":
                if let items = JSONreply["items"] as? NSArray {
                    for item in items{
                        if let nowItsADictionary = item as? NSDictionary {
                            if let title = nowItsADictionary["title"] as? String{
                                //self.results.append(title)
                                //returnItem.append(["title":title])
                                returnItem["title"] = title
                            }
                            if let link = nowItsADictionary["link"] as? String{
                                //self.results.append(link)
                                //returnItem.append(["link":link])
                                returnItem["link"] = link
                            }
                        }
                        println("Now appending...")
                        println(returnItem)
                        self.results.append(returnItem)
                    }
                }
            default:
                results = [["title":"Error: No Results Returned","link":""]] as Array
        }
        NSOperationQueue.mainQueue().addOperationWithBlock() {
            self.resultsTable.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar!) {
//        typeOfSearch = "debug"
//        endpoint = "debug"
        NC.fetchJSON(typeOfSearch!, endpoint: self.endpoint!+detailSearchBar.text, callback: parseByType)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsTable.dataSource = self
        resultsTable.delegate = self
        detailSearchBar.delegate = self
        
        if let test = endpoint {
            println("endpoint set")
        }else {
            println("first screen")
            self.results = [["title":""]]
            detailSearchBar.frame.size.height = 0
        }
        
        if let dbg = typeOfSearch {
            println("Type of search set to: \(dbg)")
        }
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("resultCell", forIndexPath: indexPath) as CustomTableViewCell
//        var dictionary = results[indexPath.row] as Dictionary<String,String>
//        var title = dictionary["title"]
//        println(title)
        println("Here's where we get into trouble.")
        println("results.indexpath[row]")
        println(results[indexPath.row])
        var whatAmI = results[indexPath.row] as Dictionary<String, String>
        println("What is this:")
        println(whatAmI)
        cell.textLabel.text = (results[indexPath.row] as Dictionary)["title"]
        //var results : [AnyObject] = [["title":"","link":""]]
        println(results)
        if let dict = (results[indexPath.row] as? Dictionary<String, String>){
            if let url = dict["title"] {
                println("url = \(url)")
                cell.link = url
            }
        }
        //cell.link = (results[indexPath.row] as Dictionary)["link"]!
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println("Did select row at index path")
        let tehInternets = self.storyboard.instantiateViewControllerWithIdentifier("webViewController") as WebViewController
        tehInternets.address = (results[indexPath.row] as Dictionary)["link"]
        self.splitViewController.showDetailViewController(tehInternets, sender: self)
    }

}

