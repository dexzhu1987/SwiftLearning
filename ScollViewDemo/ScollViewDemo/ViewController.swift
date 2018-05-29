//
//  ViewController.swift
//  ScollViewDemo
//
//  Created by dexunzhu on 2018-05-29.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scollView: UIScrollView! {
        didSet {
            scollView.addSubview(imageView)
            scollView.maximumZoomScale = 1.0
            scollView.minimumZoomScale = 1/25
            scollView.delegate = self
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        //which view you want to zoom
        return imageView
    }
    
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                //am i on the screen, check window property of window
                fetchImage() //check image property is on the screen
            }
        }
    }
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scollView.contentSize = imageView.frame.size
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            //create a data from URL
            let urlContents = try? Data(contentsOf: url) //Data optional type with try? == either image or nil
            if let imageData = urlContents {
                image = UIImage(data: imageData)
            }
        }
    }
    
    var imageView = UIImageView() //frame 0.0 size 0.0

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageURL = ModelURLs.vancouver
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

