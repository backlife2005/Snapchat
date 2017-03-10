//
//  SelecUserViewController.swift
//  Snapchat
//
//  Created by Mohammed Al-Khonaizi on 3/10/17.
//  Copyright © 2017 Mohammed Al-Khonaizi. All rights reserved.
//

import UIKit

class SelecUserViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    // @IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        
        self.tableView.delegate = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell ()
    }

}
