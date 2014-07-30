//
//  ViewController.swift
//  Stack Overflow App
//
//  Created by Alex on 7/28/14.
//  Copyright (c) 2014 Alex Rice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var items : NSArray = []
    var NC = NetworkController()
    func setItemsCallback(JSONitems: NSArray) -> Void {
        self.items = JSONitems
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func searchButton(sender: AnyObject) {
        NC.fetchJSONforSearchByTag(byTag: searchBar.text, callback: setItemsCallback)
    }
    
    @IBAction func printIt(sender: AnyObject) {
        println(self.items)
    }
    
    @IBAction func button(sender: AnyObject) {
        //NC.fetchJSONforItemType("User", byId: "135152")
        NC.fetchJSONforItemType("Question", byId: "1343344", callback: setItemsCallback)
        //NC.fetchJSONforItemType("Answer", byId: "4101761")
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

