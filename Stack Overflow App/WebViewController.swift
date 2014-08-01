//
//  WebViewController.swift
//  Stack Overflow App
//
//  Created by Alex on 7/31/14.
//  Copyright (c) 2014 Alex Rice. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var address : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let requestURL = NSURL(string: address!)
        let request = NSURLRequest(URL: requestURL)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
