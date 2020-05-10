//
//  Question.swift
//  QuizApp
//
//  Created by five on 06/05/2020.
//  Copyright © 2020 five. All rights reserved.
//

import Foundation

class Question {
    
    let correctAnswer: Int?
    let id: Int?
    var answers: [String?]
    let question: String?
    
    init?(json: [String: Any]) {
        
        self.answers = []
        self.correctAnswer = json["correct_answer"] as? Int
        self.id = json["id"] as? Int
        self.question = json["question"] as? String
        
        if let answers = json["answers"] as? [String] {
            self.answers = answers
        }
    }
    
    
}
