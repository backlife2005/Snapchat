//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by Mohammed Al-Khonaizi on 3/7/17.
//  Copyright © 2017 Mohammed Al-Khonaizi. All rights reserved.
//

import UIKit

import Firebase

class SnapsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // @IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // @IBAction
    
    @IBAction func logoutTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    // Classes
    
    var snaps : [Snap] = []
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // The data Source and delegate of the tableView.
        
        self.tableView.dataSource = self
        
        self.tableView.delegate = self
        
        
        // The code for pull the data off the Database of Firebse
        
        let currentLoggedUser = FIRAuth.auth()!.currentUser!.uid // This is not part of the course, I added this myself.
        
        FIRDatabase.database().reference().child("users").child(currentLoggedUser).child("snaps").observe(FIRDataEventType.childAdded, with: {(snapshot) in
            
            print(snapshot) // Print content of snapshot
            

            let snap = Snap ()  // Declaration of the local instance constant of Snap class
            
            
            snap.snapFrom = (snapshot.value as! NSDictionary) ["from"] as! String  // Stores the email
            
            snap.snapImageDescription = (snapshot.value as! NSDictionary) ["description"] as! String  // Stores the email
            
            snap.snapImageURL = (snapshot.value as! NSDictionary) ["imageURL"] as! String  // Stores the email
            
            
            self.snaps.append(snap)  // Adds the content of the local user constant to the users property variable
            
            self.tableView.reloadData()  // Cuases to the code within cellForRowAt indexPath to be executed.

        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return snaps.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell ()
        
        let snap = snaps[indexPath.row]
        
        cell.textLabel?.text = snap.snapFrom
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sanp = snaps[indexPath.row]
        
        performSegue(withIdentifier: "viewSnapSegue", sender: sanp)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewSnapSegue" {
         
            let nextVC = segue.destination as! ViewSnapViewController
            nextVC.snap = sender as! Snap
            
        } 
        
        
    }
    
    
    
}
