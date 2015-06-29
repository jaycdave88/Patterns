//
//  ZoomViewController.swift
//  Patterns
//
//  Created by DEV MODE on 6/29/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController, UIScrollViewDelegate {

    var image: UIImage? = nil // creating a var for the detailedViewController to share with zoomViewConroller

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do you...

        self.scrollView.minimumZoomScale = 1 // never for scrollview to be less then 1
        self.scrollView.maximumZoomScale = 50 // at the most zoom
        self.scrollView.delegate = self // setting the delagete for scrollview
        self.imageView.image = self.image! // 
    }

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

}
