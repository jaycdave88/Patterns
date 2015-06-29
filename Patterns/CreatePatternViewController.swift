//
//  CreatePatternViewController.swift
//  Patterns
//
//  Created by DEV MODE on 6/29/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

import UIKit
import CoreData

class CreatePatternViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil) // will dismiss the current view

    }

    @IBAction func saveTapped(sender: AnyObject) {
        var context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext! // get the applications delgate, calling the managed Object context // the lazy method

        var pattern = NSEntityDescription.insertNewObjectForEntityForName("Pattern", inManagedObjectContext: context) as! Pattern

        pattern.name = self.nameField.text // save the name in nameField as the pattern name
        context.save(nil) // save data
        self.dismissViewControllerAnimated(true, completion: nil) // dismiss after save
    }
}
