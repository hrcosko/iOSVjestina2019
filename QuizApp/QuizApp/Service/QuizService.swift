//
//  QuizService.swift
//  QuizApp
//
//  Created by five on 06/05/2020.
//  Copyright © 2020 five. All rights reserved.
//

import Foundation

class QuizService {
    /*
    static func fetchQuizzes(urlString: String) -> [Quiz] {
        var quizzes: [Quiz] = []
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let data = data {
                    
                    do {
                        
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                        //print(json)
                        
                        if let array = json["quizzes"] as? [Any] {
                            
                            for object in array {
                                
                                //print(object)
                                guard let quiz = Quiz(json: object as! [String : Any]) else {
                                    print("JEDNOG NISAM DOHVATIO")
                                    continue}
                                quizzes.append(quiz)
                            }
                        }
                        
              
                        
                    } catch {
                        
                    }
                    
                } else {
                    
                }
            }
            dataTask.resume()
        } else {
            
        }
        return quizzes
    }
    */
    
    static func fetchQuizzes(completion: @escaping (([Quiz]?) -> Void)) -> Void {
        var quizzes: [Quiz] = []
        let baseUrl = "https://iosquiz.herokuapp.com/api/quizzes"
        if let url = URL(string: baseUrl) {
            let request = URLRequest(url: url)
            
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        if let resultsList = json as? [String: Any] {
                            if let array = resultsList["quizzes"] as? [Any] {
                                
                                for object in array {
                                    
                                    //print(object)
                                    guard let quiz = Quiz(json: object as! [String : Any]) else {
                                        print("JEDNOG NISAM DOHVATIO")
                                        continue}
                                    quizzes.append(quiz)
                                }
                            }
                            completion(quizzes)
                        } else {
                            completion(nil)
                        }
                    } catch {
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            }
            dataTask.resume()
        } else {
            completion(nil)
        }
        
    }
    
}
