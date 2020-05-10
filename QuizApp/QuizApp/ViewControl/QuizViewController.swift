//
//  QuizViewController.swift
//  QuizApp
//
//  Created by five on 06/05/2020.
//  Copyright © 2020 five. All rights reserved.
//

import UIKit

//promjeni u uiviewcontroler
class QuizViewController: UIView, UITableViewDelegate,  UITableViewDataSource {
    
    var quizzes: [Quiz]?
    
    
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var QuizTable: UIView!
    @IBOutlet weak var failMsg: UILabel!
    @IBOutlet weak var funfactLabel: UILabel!
    
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    func setupTableView() {
        tableview.backgroundColor = UIColor.white
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(UINib(nibName: "QuizTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
        
        QuizTable.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.QuizTable.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.QuizTable.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.QuizTable.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.QuizTable.leftAnchor)
        ])
        
        //tableView.register(UINib(nibName: "QuizTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(numberOfQuizzes())
        return numberOfQuizzes()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! QuizTableViewCell
        //cell.backgroundColor = UIColor.white
        
        if let quiz = quiz(atIndex: indexPath.row) {
            cell.setup(withQuiz: quiz)
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 163
    }
    
    func quiz(atIndex index: Int) -> Quiz? {
        guard let quizzes = quizzes else {
            return nil
        }
        
        return quizzes[index]
    }
    
    func numberOfQuizzes() -> Int {
        return quizzes?.count ?? 0
    }
    
    func fetchQuizzes() {
        QuizService.fetchQuizzes { [weak self] (quizzes) in
            self?.quizzes = quizzes
            
            //print(self?.numberOfQuizzes())
            DispatchQueue.main.async {
                if let quizzes = quizzes {
                    
                    self?.funfactLabel.isHidden = false
                    self?.setupTableView()
                    
                    for item in quizzes {
                        
                        let str = item.questions.first!?.question
                        if str!.contains("NBA") {
                            //print("sadrži")
                        }
                    }
                    
                }
                else {
                    self?.failMsg.isHidden = false
                }
            }
        }
        
    }
    
    @IBAction func dohvatiButton(_ sender: Any) {
        if (self.funfactLabel.isHidden) {
            fetchQuizzes()
        }
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        Bundle.main.loadNibNamed("QuizViewController", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }

}
