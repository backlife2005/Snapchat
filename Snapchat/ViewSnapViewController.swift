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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        snapDescriptionLable.text = snap.snapImageDescription
        
        snapImageView.sd_setImage(with: URL (string: snap.snapImageURL))
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        print("Goodbye")
        
        // This is not part of the course, I added this myself.
        // let currentLoggedUserUID = FIRAuth.auth()!.currentUser!.uid
        // FIRDatabase.database().reference().child("users").child(currentLoggedUserUID).child("Snaps").child(snap.key).removeValue()
        
        // This is how it was done in the course
        
        FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("Snaps").child(snap.key).removeValue()
        
    }

}
