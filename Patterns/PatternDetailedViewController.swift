//
//  PatternDetailedViewController.swift
//  Patterns
//
//  Created by DEV MODE on 6/26/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

import UIKit

class PatternDetailedViewController: UIViewController {

    var pattern : Pattern? = nil // making a property of type Pattern and set it first to equal nil 

    var tappedImage : UIImage? = nil

    @IBOutlet weak var frontImageView: UIImageView! // attaching storyboard item to code
    @IBOutlet weak var backImageView: UIImageView! // attaching storyboard item to code


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.navigationItem.title = self.pattern!.name // setting the name of from the UItable view to the name of detailedVIewControler
        self.frontImageView.image = UIImage(data: pattern!.frontImage) // setting the correct image
        self.backImageView.image = UIImage(data: pattern!.backImage)

        var frontTapRecognizer = UITapGestureRecognizer(target: self, action: "frontTapped") // adding a genster to the varible, self is the class (patternDetailedViewController and "frontTapped is the function that will be called
        self.frontImageView.addGestureRecognizer(frontTapRecognizer)// adding a gester to the frontImageView with the frontTapRecognizer

        var backTapRecognizer = UITapGestureRecognizer(target: self, action: "backTapped")
        self.backImageView.addGestureRecognizer(backTapRecognizer)
    }

    func frontTapped(){
        self.tappedImage = self.frontImageView.image
        self.performSegueWithIdentifier("zoomSegue", sender: self)

    }

    func backTapped(){
        self.tappedImage = self.backImageView.image
        self.performSegueWithIdentifier("zoomSegue", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var zoomViewController = segue.destinationViewController as! ZoomViewController
        zoomViewController.image = self.tappedImage!
    }
}
