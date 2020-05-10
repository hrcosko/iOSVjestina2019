//
//  Quiz.swift
//  QuizApp
//
//  Created by five on 06/05/2020.
//  Copyright © 2020 five. All rights reserved.
//

import Foundation

class Quiz {
    
    let title: String?
    let description: String?
    let lvl: Int?
    let category: String?
    let urlImage: String?
    var questions: [Question?]
    
    enum color {}
    
    init?(json: [String: Any]) {
        //print(json)
        
        self.title = json["title"] as? String
        self.description = json["description"] as? String
        self.lvl = json["level"] as? Int
        
        self.category = json["category"] as? String
        self.urlImage = json["image"] as? String
        self.questions = []
        
        //print("++++++++++++++++++++++++++Quiz cat: ",self.category)
        
        if let questions = json["questions"] as? [Any] {
            for it in questions {
                //print("Q:", it)
                guard let obj = Question(json: it as! [String: Any]) else {
                    continue
                }
                self.questions.append(obj)
            }
        }
        else {print("ne prolazi")}
        
        
    }
}
