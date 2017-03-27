//
//  ViewSnapViewController.swift
//  Snapchat
//
//  Created by Mohammed Al-Khonaizi on 3/12/17.
//  Copyright © 2017 Mohammed Al-Khonaizi. All rights reserved.
//

import UIKit

import Firebase

import SDWebImage


class ViewSnapViewController: UIViewController {
    
    // @IBOutlet
    
    @IBOutlet weak var snapImageView: UIImageView!
    
    @IBOutlet weak var snapDescriptionLable: UILabel!
    
    // Property Variable of type Snap class
    
    
    var snap = Snap ()
    
    let mySnaps = Snaps () // Instantiate the Snaps () Class
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        snapDescriptionLable.text = snap.snapImageDescription
        
        snapImageView.sd_setImage(with: URL(string: snap.snapImageURL))

        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        // print("Goodbye")
        
        /*
         FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").child(snap.key).removeValue()
         
         */
        
        mySnaps.removeSanp(snapKey: snap.key)
        
        
    }
    
}


