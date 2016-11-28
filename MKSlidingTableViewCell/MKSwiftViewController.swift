//
//  MKSwiftViewController.swift
//  MKSlidingTableViewCell
//
//  Created by Andrzej Michnia on 12.03.2016.
//  Copyright © 2016 Michael Kirk. All rights reserved.
//

import UIKit

class MKSwiftViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MKSlidingTableViewCellDelegate {

    @IBOutlet var tableView: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let
        containerCell = tableView.dequeueReusableCell(withIdentifier: "container") as? MKSlidingTableViewCell,
        let foregroundCell = tableView.dequeueReusableCell(withIdentifier: "foreground") as? MKActionTableViewCell, // Or its subclass
        let drawerCell = tableView.dequeueReusableCell(withIdentifier: "background") as? MKActionTableViewCell  // Or its subclass
        else {
            return UITableViewCell()
        }
        
        containerCell.foregroundView = foregroundCell
        containerCell.drawerView = drawerCell
        containerCell.delegate = self
        
        return containerCell
    }

    func didSelect(_ cell: MKSlidingTableViewCell!) {
        print("Did select")
    }
    
}
