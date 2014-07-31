//
//  NetworkController.swift
//  Stack Overflow App
//
//  Created by Alex on 7/29/14.
//  Copyright (c) 2014 Alex Rice. All rights reserved.
//

import UIKit

class NetworkController: NSObject {
   ///2.2/search?order=desc&sort=activity&intitle=TITLE&site=stackoverflow
    func fetchJSONforItemType(itemtype: String, byId id: String, callback: (items: NSArray) -> Void) {
        var url = NSURL()
        switch itemtype {
        case "User":
            url = NSURL(string: "http://api.stackexchange.com/2.2/users/"+id+"?order=desc&sort=reputation&site=stackoverflow")
        case "Answer":
            url = NSURL(string: "http://api.stackexchange.com/2.2/answers/"+id+"?order=desc&sort=activity&site=stackoverflow")
        case "Question":
            url = NSURL(string: "http://api.stackexchange.com/2.2/questions/"+id+"?order=desc&sort=activity&site=stackoverflow")
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
//                let responseJSON = NSString(data:data, encoding:NSUTF8StringEncoding)
//                println(responseJSON)
                var parsed : AnyObject = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: nil)
                parsedJSON = parsed as NSDictionary
                callback(items: (parsedJSON["items"] as NSArray))
            }
        })
        task.resume()
        
    }

    
    func fetchJSONforSearchByTag(byTag tag: String, callback: (items: NSArray) -> Void) {
        var url = NSURL()
        url = NSURL(string: "http://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged="+tag+"&site=stackoverflow")
        let request = NSURLRequest(URL: url)
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        var parsedJSON = [:]
        let task = session.dataTaskWithRequest(request, completionHandler: { (data : NSData!, response : NSURLResponse!, error :NSError!) -> Void in
            if error {
                println("session error")
                println(error.localizedDescription)
                
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
                //let responseJSON = NSString(data:data, encoding:NSUTF8StringEncoding)
                //println(responseJSON)
                var parsed : AnyObject = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: nil)
                parsedJSON = parsed as NSDictionary
                callback(items: (parsedJSON["items"] as NSArray))
            }
            })
        task.resume()
        
    }
    
    func justWorkDamnit(callback: (text: String) -> Void) {
        var url = NSURL()
            url = NSURL(string:"https://www.google.com/")
        
        let request = NSURLRequest(URL: url)
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        var parsedJSON = [:]
        let task = session.dataTaskWithRequest(request, completionHandler: { (data : NSData!, response : NSURLResponse!, error :NSError!) -> Void in
            if error {
                println("session error")
                println(error.localizedDescription)
            }
            else {
                if let httpResponse = response as? NSHTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200:
                        println("Response 200 - Winning")
                    default:
                        println("Status Code was:\(httpResponse.statusCode)")
                    }
                }
                //                let responseJSON = NSString(data:data, encoding:NSUTF8StringEncoding)
                //                println(responseJSON)
                var text = NSString(data: data, encoding: NSUTF8StringEncoding)
                callback(text: text)
            }
            })
        task.resume()
        
    }
}
