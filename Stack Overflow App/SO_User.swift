//
//  SO_User.swift
//  Stack Overflow App
//
//  Created by Alex on 7/28/14.
//  Copyright (c) 2014 Alex Rice. All rights reserved.
//

import UIKit

class SO_User: NSObject {
    var account_id = 0
    var user_id = 0
    var name = ""
    var avatar_url: NSURL?
    var reputation = 0
    
    init(){
        println("hello")
    }
    
}

//{
//    "items": [
//    {
//    "badge_counts": {
//    "bronze": 313,
//    "silver": 228,
//    "gold": 18
//    },
//    "account_id": 45798,
//    "is_employee": false,
//    "last_modified_date": 1404843824,
//    "last_access_date": 1405560765,
//    "reputation_change_year": 13726,
//    "reputation_change_quarter": 1623,
//    "reputation_change_month": 1623,
//    "reputation_change_week": 90,
//    "reputation_change_day": 50,
//    "reputation": 144185,
//    "creation_date": 1247077693,
//    "user_type": "registered",
//    "user_id": 135152,
//    "accept_rate": 100,
//    "website_url": "",
//    "link": "http://stackoverflow.com/users/135152/omg-ponies",
//    "display_name": "OMG Ponies",
//    "profile_image": "https://www.gravatar.com/avatar/84dc26c6486551ba2b477b8ec35e90dc?s=128&d=identicon&r=PG"
//    }
//    ],
//    "has_more": false,
//    "quota_max": 10000,
//    "quota_remaining": 9940
//}