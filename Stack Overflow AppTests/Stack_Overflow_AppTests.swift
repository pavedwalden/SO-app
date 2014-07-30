//
//  Stack_Overflow_AppTests.swift
//  Stack Overflow AppTests
//
//  Created by Alex on 7/28/14.
//  Copyright (c) 2014 Alex Rice. All rights reserved.
//

import UIKit
import XCTest

class Stack_Overflow_AppTests: XCTestCase {
    let testNC = NetworkController()
    
    func testUserInstantiation() {
        let user = SO_User()
        XCTAssertNotNil(user.account_id, "account_id property exists")
        XCTAssertNotNil(user.user_id, "user property exists")
        XCTAssertNotNil(user.name, "name property exists")
        XCTAssertNotNil(user.reputation, "reputation property exists")
    }
    
    func testQuestionInstantiation() {
        let question = SO_Question()
        XCTAssertNotNil(question.question_id, "question_id property exists")
        XCTAssertNotNil(question.tags, "tags property exists")
        XCTAssertNotNil(question.owner_id, "owner_id property exists")
        XCTAssertNotNil(question.accepted_answer, "accepted_answer property exists")
        XCTAssertNotNil(question.score, "score property exists")
    }
    
    func testAnswerInstantiation() {
        let answer = SO_Answer()
        XCTAssertNotNil(answer.user_id, "user_id property exists")
        XCTAssertNotNil(answer.answer_id, "answer_id property exists")
        XCTAssertNotNil(answer.question_id, "question_id property exists")
        XCTAssertNotNil(answer.is_accepted, "is_accepted property exists")
        XCTAssertNotNil(answer.creation_date, "creation_date property exists")
    }
    
    func testQueryForUser() {
        testNC.fetchJSONforItemType("User", id: "135152")
    }
    
    func testQueryForQuestion() {
        testNC.fetchJSONforItemType("Question", id: "1343344")
    }
    
    func testQueryForAnswer() {
        testNC.fetchJSONforItemType("Answer", id: "4101761")
    }
}
