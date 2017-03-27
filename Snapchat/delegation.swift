
//
//  delegation.swift
//  Snapchat
//
//  Created by Mohammed Al-Khonaizi on 3/19/17.
//  Copyright © 2017 Mohammed Al-Khonaizi. All rights reserved.
//

import Foundation

import Firebase


class Snaps {
    
    
    func retrieveSnaps (completion: @escaping (Snap) -> ()) {
        
        
        let uid = FIRAuth.auth()!.currentUser!.uid
        
        let ref = FIRDatabase.database().reference()
        
        let path = ref.child("users").child(uid).child("snaps")
        
        path.observe(FIRDataEventType.childAdded, with: {(snapshot) in
            
            let snap = setSnap(snapshot: snapshot)
            
            completion (snap)
            
        })
        
    }
    
    func removeSanp(snapKey: String) {
        
        let uid = FIRAuth.auth()!.currentUser!.uid
        
        let ref = FIRDatabase.database().reference()
        
        let snap = ref.child("users").child(uid).child("snaps").child(snapKey)
        
        snap.removeValue()
    }
    
}



func setSnap(snapshot : FIRDataSnapshot) -> Snap {
    
    let snap = Snap ()
    
    if let dictionary = (snapshot.value as? [String: String]) {
        
        snap.snapFrom = dictionary["from"]!
        
        snap.snapImageDescription = dictionary["description"]!
        
        snap.snapImageURL = dictionary["imageURL"]!
        
        snap.key = snapshot.key
        
    }
    
    return snap
}






















// func retrieveSnapsdddddd () {
//
//    // The code for pull the data off the Database of Firebse
//
//    let uid = FIRAuth.auth()!.currentUser!.uid // This is not part of the course, I added this myself.
//
//    let ref = FIRDatabase.database().reference()
//
//    let path = ref.child("users").child(uid).child("snaps")
//
//    path.observe(FIRDataEventType.childAdded, with: {(snapshot) in
//
//        // print(snapshot) // Print content of snapshot
//
//        let snap = Snap ()  // Declaration of the local instance constant of Snap class
//
//        snap.snapFrom = (snapshot.value as! NSDictionary) ["from"] as! String  // Stores the email
//
//        snap.snapImageDescription = (snapshot.value as! NSDictionary) ["description"] as! String  // Stores the email
//
//        snap.snapImageURL = (snapshot.value as! NSDictionary) ["imageURL"] as! String  // Stores the email
//
//        snap.key = snapshot.key // Stores the key for the uid which assigned to the snap.
//
//        Snaps.append(snap)  // Adds the content of the local user constant to the users property variable
//
//        print(snaps.count)
//
//        //return self.snaps
//
//        nc.post(name: NSNotification.Name(myNotificationKey), object: self.snaps)
//
//        // self.snapsDataWasRetrieved(snapsData: self.snaps)
//
//    })
//
//
//
//}

