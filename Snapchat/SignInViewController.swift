//
//  SignInViewController.swift
//  Snapchat
//
//  Created by Mohammed Al-Khonaizi on 3/7/17.
//  Copyright © 2017 Mohammed Al-Khonaizi. All rights reserved.
//

import UIKit

import Firebase

class SignInViewController: UIViewController {
    
    // @IBOutlet
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    // @IBAction
    
    @IBAction func turnUpTapped(_ sender: Any) {
        
        // Firebase Code
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            
            print("We tried to sign in")
            
            if error != nil {
                
                print("Hey we have an error: \(error)")
                
            } else {
                
                print("Signed in Successfully")
            }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

