//
//  ELoginController.swift
//  e-Mentoring
//
//  Created by Taras Pasichnyk on 7/1/17.
//  Copyright © 2017 Taras Pasichnyk. All rights reserved.
//

import UIKit
import Firebase

class ELoginController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInButtonTouched(_ sender: UIButton) {
        guard let email = emailTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                return
            }
            
            self._openApplication()
        }
        
        //        let firebaseAuth = Auth.auth()
        //        do {
        //            try firebaseAuth.signOut()
        //        } catch let signOutError as NSError {
        //            print ("Error signing out: %@", signOutError)
        //        }
    }
    
    @IBAction func signUpButtonTouched(_ sender: UIButton) {
        let signUpVC = UIStoryboard.login.instantiateViewController(
        withIdentifier: String(describing: ESignUpController.self)) as! ESignUpController
        self.present(signUpVC, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    private func _openSignUpController() {
        let signUpVC = UIStoryboard.login.instantiateViewController(
            withIdentifier: String(describing: ESignUpController.self)) as! ESignUpController
        self.present(signUpVC, animated: true, completion: nil)
    }
    
    private func _openApplication() {
        let cardsVC = UIStoryboard.swiper.instantiateViewController(
            withIdentifier: String(describing: ESwipeCardsController.self)) as! ESwipeCardsController
        self.present(cardsVC, animated: true, completion: nil)
    }

}
