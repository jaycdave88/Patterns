//
//  CreatePatternViewController.swift
//  Patterns
//
//  Created by DEV MODE on 6/29/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

import UIKit
import CoreData

class CreatePatternViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var frontPicture = true

    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        var frontTapRecognizer = UITapGestureRecognizer(target: self, action: "frontTapped")
        self.frontImageView.addGestureRecognizer(frontTapRecognizer)


        var backTapRecognizer = UITapGestureRecognizer(target: self, action: "backTapped")
        self.backImageView.addGestureRecognizer(backTapRecognizer)
    }

    func frontTapped(){
        self.frontPicture = true
        launchCamera()
    }

    func backTapped(){
        self.frontPicture = false
        launchCamera()
    }

    func launchCamera(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){ // checks to see if the phone has a camera
            var cameraViewController = UIImagePickerController() // launch camera and take pictures
            cameraViewController.sourceType = UIImagePickerControllerSourceType.Camera // sourcetype is going to be set to camera
            cameraViewController.delegate = self // delegate is self
            self.presentViewController(cameraViewController, animated: true, completion: nil) // present the camera
        }// end if
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) { // accepts a boolean value
        if self.frontPicture{ // easy way to have two option
            self.frontImageView.image = image
        }else{
            self.backImageView.image = image
        }
        picker.dismissViewControllerAnimated(true, completion: nil) // needed to dismiss the view from the camera
    }


    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil) // will dismiss the current view

    }

    @IBAction func saveTapped(sender: AnyObject) {
        var context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext! // get the applications delgate, calling the managed Object context // the lazy method

        var pattern = NSEntityDescription.insertNewObjectForEntityForName("Pattern", inManagedObjectContext: context) as! Pattern
        pattern.name = self.nameField.text // save the name in nameField as the pattern name
        pattern.frontImage = UIImageJPEGRepresentation(self.frontImageView.image,1) // saves the front image with the argument of high res
        pattern.backImage = UIImageJPEGRepresentation(self.backImageView.image,1) // saves the back image with high res
        if pattern.name == ""{
            alertMessage()
        } else{
            context.save(nil) // save data
            self.dismissViewControllerAnimated(true, completion: nil) // dismiss after save
        }
    }

    func alertMessage(){
        let title = "Oops!"
        let message = "Looks like you forgot to add a name!"
        let okayText = "OK"

        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let okayButton = UIAlertAction(title: okayText, style: UIAlertActionStyle.Cancel, handler: nil)

        alert.addAction(okayButton)
        presentViewController(alert, animated: true, completion: nil)
    }

}
