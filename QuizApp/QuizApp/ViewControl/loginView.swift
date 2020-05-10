//
//  loginView.swift
//  QuizApp
//
//  Created by five on 06/05/2020.
//  Copyright © 2020 five. All rights reserved.
//

import UIKit

class loginView: UIView {
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var logoImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        Bundle.main.loadNibNamed("loginView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        logoImage.image = UIImage(named: "QUIZ")
    }
        

}
