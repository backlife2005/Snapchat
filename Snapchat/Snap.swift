//
//  Snap.swift
//  Snapchat
//
//  Created by Mohammed Al-Khonaizi on 3/12/17.
//  Copyright © 2017 Mohammed Al-Khonaizi. All rights reserved.
//

import Foundation

import Firebase

class Snap {
    
    
    var snapImageDescription = ""
    
    var snapImageURL = ""
    
    var snapFrom = ""
    
    var key = ""
    
}

func removeSnap (snapKey : String){
    
    let uid = FIRAuth.auth()!.currentUser!.uid
    let ref = FIRDatabase.database().reference()
    let snap = ref.child("users").child(uid).child("snaps").child(snapKey)
    
    snap.removeValue()
    
    
    
    // FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").child(snap.key).removeValue()
}
