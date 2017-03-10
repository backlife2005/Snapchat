//
//  SelecUserViewController.swift
//  Snapchat
//
//  Created by Mohammed Al-Khonaizi on 3/10/17.
//  Copyright © 2017 Mohammed Al-Khonaizi. All rights reserved.
//

import UIKit

import Firebase


class SelecUserViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    // @IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // Classes
    
    var users : [User] = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        // The data Source and delegate of the tableView.
        
        self.tableView.dataSource = self
        
        self.tableView.delegate = self
        
        
        
        // The code for pull the data off the Database of Firebse
        
        FIRDatabase.database().reference().child("users").observe(FIRDataEventType.childAdded, with: {(snapshot) in
            
            print(snapshot) // Print content of snapshot
            
            let user = User() // Declaration of the local instance constant of User class
            
            user.uid = snapshot.key // Stores the UUID
            
            user.email = (snapshot.value as! NSDictionary) ["email"] as! String // Stores the email
            
            self.users.append(user) // Adds the content of the local user constant to the users property variable
            
            self.tableView.reloadData() // Cuases to the code within cellForRowAt indexPath to be executed.
            
            
            
            
        })
        
        // As of the release of Swift 3 under XCode 8, the below method doesnt work anymore
        // user.email = snapshot.value!["email"] as! String
        
        // One of the following methods should be used to pass the value of snapshor
        
        // Method #1
        // user.email = (snapshot.value as! NSDictionary) ["email"] as! String
        
        // Method #2
        // let snapshotValue = snapshot.value as? NSDictionary
        // user.email = snapshotValue!["email"] as! String
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  UITableViewCell ()
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.email
        
        return cell
    }
    
}
