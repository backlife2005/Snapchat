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

struct SnapData {
    
    var snapImageDescription = ""
    
    var snapImageURL = ""
    
    var snapFrom = ""
    
    var key = ""
}


class fb {
    
    var uid = FIRAuth.auth()!.currentUser!.uid
    
    var ref = FIRDatabase.database().reference()
    
}

