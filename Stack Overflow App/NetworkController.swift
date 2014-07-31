//
//  NetworkController.swift
//  Stack Overflow App
//
//  Created by Alex on 7/29/14.
//  Copyright (c) 2014 Alex Rice. All rights reserved.
//

import UIKit

class NetworkController: NSObject {
    func fetchJSONforItemType(itemtype: String, key: String, callback: (type: String, items: NSDictionary) -> Void) {
        var url = NSURL()
        switch itemtype {
        case "User":
            url = NSURL(string: "http://api.stackexchange.com/2.2/users/"+key+"?order=desc&sort=reputation&site=stackoverflow")
        case "Answer":
            url = NSURL(string: "http://api.stackexchange.com/2.2/answers/"+key+"?order=desc&sort=activity&site=stackoverflow")
        case "Question":
            url = NSURL(string: "http://api.stackexchange.com/2.2/questions/"+key+"?order=desc&sort=activity&site=stackoverflow")
        case "Search":
            url = NSURL(string: "http://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged="+key+"&site=stackoverflow")
        default:
            url = NSURL(string:"https://www.google.com/")
        }
        
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
                callback(type: "Search", items: serialized as NSDictionary)
                //^^^FIX: hardcoded because I was having variable troubles
            }
        })
        task.resume()
    }
}
