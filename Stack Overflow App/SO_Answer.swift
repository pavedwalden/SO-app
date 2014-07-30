//
//  SO_Answer.swift
//  Stack Overflow App
//
//  Created by Alex on 7/28/14.
//  Copyright (c) 2014 Alex Rice. All rights reserved.
//

import UIKit

class SO_Answer: NSObject {
    var user_id = 0
    var answer_id = 0
    var question_id = 0
    var is_accepted = true
    var creation_date = 0

}

//{
//    "items": [
//    {
//    "owner": {
//    "reputation": 144195,
//    "user_id": 135152,
//    "user_type": "registered",
//    "accept_rate": 100,
//    "profile_image": "https://www.gravatar.com/avatar/84dc26c6486551ba2b477b8ec35e90dc?s=128&d=identicon&r=PG",
//    "display_name": "OMG Ponies",
//    "link": "http://stackoverflow.com/users/135152/omg-ponies"
//    },
//    "is_accepted": true,
//    "score": 249,
//    "last_activity_date": 1288907568,
//    "creation_date": 1288907568,
//    "answer_id": 4101761,
//    "question_id": 4101739
//    }
//    ],
//    "has_more": false,
//    "quota_max": 10000,
//    "quota_remaining": 9838
//}