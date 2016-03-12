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
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let
        containerCell = tableView.dequeueReusableCellWithIdentifier("container") as? MKSlidingTableViewCell,
        foregroundCell = tableView.dequeueReusableCellWithIdentifier("foreground") as? MKActionTableViewCell, // Or its subclass
        drawerCell = tableView.dequeueReusableCellWithIdentifier("background") as? MKActionTableViewCell  // Or its subclass
        else {
            return UITableViewCell()
        }
        
        containerCell.foregroundView = foregroundCell
        containerCell.drawerView = drawerCell
        containerCell.delegate = self
        
        return containerCell
    }

    func didSelectSlidingTableViewCell(cell: MKSlidingTableViewCell!) {
        print("Did select")
    }
    
}
