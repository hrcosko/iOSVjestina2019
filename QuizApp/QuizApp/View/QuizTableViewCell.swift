//
//  QuizTableViewCell.swift
//  QuizApp
//
//  Created by five on 08/05/2020.
//  Copyright © 2020 five. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var quizViewImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    func getImage(quiz: Quiz, completion: @escaping ((UIImage?) -> Void)){
        guard let urlString = quiz.urlImage else { return completion(nil) }
        if let url = URL(string: urlString) {
            
            let request = URLRequest(url: url)
        
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                print("fetched image")
                if let data = data {
                    let image = UIImage(data: data)
                    completion(image)
                    print("completion called")
                } else {
                    completion(nil)
                }
            }
            dataTask.resume()
        } else {
            completion(nil)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        categoryLabel.font = UIFont.systemFont(ofSize: 18)
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textColor = UIColor.gray
        descriptionLabel.numberOfLines = 0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        categoryLabel.text = ""
        descriptionLabel.text = ""
        
    }
    
    func setup(withQuiz quiz: Quiz) {
        titleLabel.text = quiz.title
        categoryLabel.text = quiz.category
        descriptionLabel.text = quiz.description
        
        getImage(quiz: quiz) { (image) in
            print("setting image")
            DispatchQueue.main.async {
                self.quizViewImage.image = image
            }
            print("image set")
        }
        
    }
}
