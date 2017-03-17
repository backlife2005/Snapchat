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
        
        let emailAccount = emailTextField.text!
        
        let emailPassword = passwordTextField.text!
        
        // Firebase Code
        
        FIRAuth.auth()?.signIn(withEmail: emailAccount, password: emailPassword, completion: { (user, error) in
            
            // print("\n \n We tried to sign in \n \n")
            
            print("\n \n Begin the process to sign in the user with current email account of \(self.emailTextField.text!) \n \n")
            
            if error != nil {
                
                // print("\n \n Hey we have an error: \(error!) \n \n")
                
                print("\n \n We are sorry, there is no record for an account with the email of \(self.emailTextField.text!). \n \n Therefore, it will be created shortly and you will be signed in automatically. \n \n The below information regarding the encountered error is for the developer referance \n \n \(error!) \n \n")
                
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    
                    // print("\n \n We tried to create a user \n \n ")
                    print("\n \n Begin the process to create an account for the email of \(self.emailTextField.text!) \n \n")
                    
                    if error != nil {
                        
                        // The following messagre will be printed if the process to create an account for the user was encountered an error
                        
                        // print("\n \n Hey we have an error: \(error!) \n \n")
                        print("\n \n We are sorry, the process to create an account for the email of \(self.emailTextField.text!) has been failed. \n \n Therefore, it will be created shortly and you will be signed in automatically. \n \n The below information regarding the encountered error is for the developer referance \n \n \(error!) \n \n ")
                        
                    } else {
                        
                        // The following code will be performed if no error was encountered during the process to creat an account for the user
                        
                        FIRDatabase.database().reference().child("users").child(user!.uid).child("email").setValue(user!.email!)
                        
                        // print("Created a user Successfully")
                        
                        print("\n \n Created a user Successfully for the email account of \(self.emailTextField.text!) \n \n")
                        
                        print("\n \n You will taken to Snaps View shortly... \n \n")
                        
                        self.performSegue(withIdentifier: "signingInSegue", sender: nil)
                        
                    }
                })
                
            } else {
                
                // print("\n \n Signed in Successfully \n \n")
                
                print("\n \n Signed in Successfully to the email account of \(self.emailTextField.text!) \n \n")
                
                print("\n \n You will taken to Snaps View shortly... \n \n")
                
                self.performSegue(withIdentifier: "signingInSegue", sender: nil)
            }
        })
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //FIRDatabase.database().reference().child("Hello").setValue("I am cool")
        
    }
    
}

