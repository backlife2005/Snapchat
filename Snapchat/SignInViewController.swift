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
                
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    
                    print("We tried to create a user ")
                    
                    if error != nil {
                        
                        print("Hey we have an error: \(error)")
                    } else {
                        
                        print("Created a user Successfully")
                        
                        self.performSegue(withIdentifier: "signingInSegue", sender: nil)
                        
                    }
                })
                
            } else {
                
                print("Signed in Successfully")
                
                self.performSegue(withIdentifier: "signingInSegue", sender: nil)
            }
        })
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        FIRDatabase.database().reference().child("Hello").setValue("I am cool")
        
    }
    
}

