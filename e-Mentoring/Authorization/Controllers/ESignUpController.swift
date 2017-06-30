//
//  ESignUpController.swift
//  e-Mentoring
//
//  Created by Taras Pasichnyk on 7/1/17.
//  Copyright © 2017 Taras Pasichnyk. All rights reserved.
//

import UIKit
import Firebase

class ESignUpController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func signUpButtonTouched(_ sender: UIButton) {
        
        guard let email = emailTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            DispatchQueue.main.async {
                if error == nil {
                    self.statusLabel.text = "Confirm your registration on email"
                    self.dismiss(animated: true, completion: nil)
                }else{
                    self.statusLabel.text = "Registration Failed... Please Try Again"
                }
                
            }
        }
    }
    
}
