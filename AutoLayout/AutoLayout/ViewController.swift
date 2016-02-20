//
//  ViewController.swift
//  AutoLayout
//
//  Created by windfantasy on 16/1/9.
//  Copyright © 2016年 windfantasy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var loginField: UITextField!

    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var companyLabel: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    var secure:Bool = false {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        passwordField.secureTextEntry = secure
        passwordLabel.text = secure ? "Secured Password":"Password"
        nameLabel.text = loggedInUser?.name
        companyLabel.text = loggedInUser?.company
        imageView.image = loggedInUser?.image
        
    }
    @IBAction func toggleSecurity() {
        secure = !secure
    }
    var loggedInUser: User? {
        didSet {updateUI()}
    }
    @IBAction func login() {
        loggedInUser = User.login(loginField.text ?? "", password: passwordField.text ?? "")
        
    }
    
    
    
}

extension User {
    var image: UIImage?  {
        if let image = UIImage(named: login) {
            return image
        } else {
            return UIImage(named: "unknown")
        }
    }
}


