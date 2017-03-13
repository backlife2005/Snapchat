//
//  ViewSnapViewController.swift
//  Snapchat
//
//  Created by Mohammed Al-Khonaizi on 3/12/17.
//  Copyright © 2017 Mohammed Al-Khonaizi. All rights reserved.
//

import UIKit

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



}
