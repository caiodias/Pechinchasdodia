//
//  LoginViewController.swift
//  Pechinchasdodia
//
//  Created by Juliana Lima on 18/10/16.
//  Copyright © 2016 Parada Desce. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let paddingForFirst = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: self.emailField.frame.size.height))
        self.emailField.leftView = paddingForFirst
        self.emailField.leftViewMode = UITextFieldViewMode .always

        let paddingForSecond = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: self.passwordField.frame.height))
        self.passwordField.leftView = paddingForSecond
        self.passwordField.leftViewMode = UITextFieldViewMode .always
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginWithEmail(_ sender: Any) {
        
    }

    @IBAction func loginWithFacebook(_ sender: Any) {
        
    }
    
    @IBAction func openRegister(_ sender: Any) {
        
    }

}
