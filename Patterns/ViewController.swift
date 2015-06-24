//
//  ViewController.swift
//  Patterns
//
//  Created by DEV MODE on 6/24/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView! // adding the tableView to the page
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self // required to set up the tableview
        self.tableView.delegate = self // required to set up the tableview
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // function is asking us for how many rows do we want our table view to have, expecting an integer
        return 5 // setting the rows to 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // function is setting up what goes on each row        
        var cell = UITableViewCell() // creating new varible for cell
        cell.textLabel?.text = "Testing" // adding text to the cell
        return cell // returning the cell
        
    }

}

