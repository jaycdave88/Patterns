//
//  ViewController.swift
//  Patterns
//
//  Created by DEV MODE on 6/24/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView! // adding the tableView to the page

    var patterns : [Pattern] = [] //created a property called patterns, which is an array of Patterns object
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self // required to set up the tableview
        self.tableView.delegate = self // required to set up the tableview
        
        createObject() // calling the function

        var context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!

        var request = NSFetchRequest(entityName: "Pattern") // is the way to grab ALL the data from core data that has the name of "Pattern"

        var results = context.executeFetchRequest(request, error: nil) // executes the request as an array 

        if results != nil{ // checking if the results array is not empty
            self.patterns = results! as! [Pattern]
        }
    }
    
    func createObject(){
        var context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext! // get the applications delgate, calling the managed Object context // the lazy method 

        var pattern = NSEntityDescription.insertNewObjectForEntityForName("Pattern", inManagedObjectContext: context) as! Pattern

            pattern.name = "Jay's test"
            pattern.frontImage = UIImageJPEGRepresentation(UIImage(named: "test_pattern.jpg"), 1) // converting jpeg to ns obect
            context.save(nil)
        
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // function is asking us for how many rows do we want our table view to have, expecting an integer
        return self.patterns.count // setting the rows to the ammount of objects that are in the patterns array
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // function is setting up what goes on each row        
        var cell = UITableViewCell() // creating new varible for cell
        var pattern = self.patterns[indexPath.row] // creating a variable that will allow you each pattern name to show on list
        cell.textLabel!.text = pattern.name // adding text to pattern from the name
        cell.imageView?.image = UIImage(data: pattern.frontImage) // adding pictures for the patterns
        return cell // returning the cell
        
    }

}

