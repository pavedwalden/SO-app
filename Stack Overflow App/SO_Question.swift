//
//  SO_Question.swift
//  Stack Overflow App
//
//  Created by Alex on 7/28/14.
//  Copyright (c) 2014 Alex Rice. All rights reserved.
//

import UIKit

class SO_Question: NSObject {
    var question_id = 0
    var tags = [String]()
    var owner_id = 0
    var accepted_answer = 0
    var score = 0
    
    init() {
        
    }
   
}

//{
//    "items": [
//    {
//    "tags": [
//    "sql",
//    "sql-server",
//    "tsql",
//    "stored-procedures"
//    ],
//    "owner": {
//    "reputation": 760,
//    "user_id": 379284,
//    "user_type": "registered",
//    "profile_image": "https://www.gravatar.com/avatar/0671d5d58f7c3ecd2feb71db3a729f37?s=128&d=identicon&r=PG",
//    "display_name": "Daniel",
//    "link": "http://stackoverflow.com/users/379284/daniel"
//    },
//    "is_answered": true,
//    "view_count": 147822,
//    "accepted_answer_id": 4101761,
//    "answer_count": 3,
//    "score": 128,
//    "last_activity_date": 1390481226,
//    "creation_date": 1288907382,
//    "last_edit_date": 1288937597,
//    "question_id": 4101739,
//    "link": "http://stackoverflow.com/questions/4101739/sql-server-select-into-existing-table",
//    "title": "SQL Server SELECT into existing table"
//    }
//    ],
//    "has_more": false,
//    "quota_max": 10000,
//    "quota_remaining": 9857
//}

