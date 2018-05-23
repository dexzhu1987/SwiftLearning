//
//  ViewController.swift
//  Assignment3
//
//  Created by dexunzhu on 2018-05-22.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var canvasView: UIView!
    
    var path = UIBezierPath()
    var startPoint = CGPoint()
    var touchPoint = CGPoint()
    var isEraser: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        canvasView.clipsToBounds = true
        canvasView.isMultipleTouchEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: canvasView) {
            startPoint = point
        }
        
      
    }
 
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: canvasView) {
            touchPoint = point
        }
        
        path.move(to: startPoint)
        path.addLine(to: touchPoint)
        startPoint = touchPoint
        
        draw()
    }
    

    func draw() {
        let stokeLayer = CAShapeLayer()
        stokeLayer.fillColor = nil
        stokeLayer.lineWidth = 5
        stokeLayer.strokeColor = UIColor.black.cgColor
        stokeLayer.path = path.cgPath
        canvasView.layer.addSublayer(stokeLayer)
        canvasView.setNeedsLayout()
    }

    @IBAction func eraser(_ sender: Any) {

        path.removeAllPoints()
        canvasView.layer.sublayers = nil
        canvasView.setNeedsLayout()
        
     }
}
