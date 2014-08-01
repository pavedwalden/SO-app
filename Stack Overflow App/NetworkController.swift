//
//  NetworkController.swift
//  Stack Overflow App
//
//  Created by Alex on 7/29/14.
//  Copyright (c) 2014 Alex Rice. All rights reserved.
//

import UIKit

class NetworkController: NSObject {
    func fetchJSON(searchType: String, endpoint: String, callback: (type: String, items: NSDictionary) -> Void) {
        println("Entering Network Controller")
        println("Endpoint: \(endpoint)")
        println("SearchType: \(searchType)")
        
        var url = NSURL(string: endpoint)
        
        let request = NSURLRequest(URL: url)
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        var parsedJSON = [:]
        let task = session.dataTaskWithRequest(request, completionHandler: { (data : NSData!, response : NSURLResponse!, error :NSError!) -> Void in
            if error {
                println("session error")
            }
            else {
                if let httpResponse = response as? NSHTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200:
                        println("Response 200 - Winning")
                    default:
                        println("F%$#!")
                    }
                }
                var serialized : AnyObject = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: nil)
                callback(type: searchType, items: serialized as NSDictionary)
            }
        })
        task.resume()
    }
}
