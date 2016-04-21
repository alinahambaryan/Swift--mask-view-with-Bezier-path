//
//  ViewController.swift
//  SwiftSampleBezier
//
//  Created by Alina Hambaryan on 4/8/16.
//  Copyright © 2016 Alina Hambaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var topView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        maskView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func maskView() {

        let shapeTopLayer = CAShapeLayer()
        var frame = self.topView.bounds
        frame.size.height = frame.height*2

        let path = UIBezierPath(roundedRect:self.topView.bounds, cornerRadius:0)
        path.appendPath(UIBezierPath(ovalInRect: frame))
        shapeTopLayer.path = path.CGPath
        shapeTopLayer.fillRule = kCAFillRuleEvenOdd
        self.topView.layer.mask = shapeTopLayer

        let shapeBottomLayer = CAShapeLayer()
        var bottomFrame = self.bottomView.bounds
        bottomFrame.origin.y -= bottomFrame.height
        bottomFrame.size.height = bottomFrame.height*2

        let bottomPath = UIBezierPath(roundedRect:self.bottomView.bounds, cornerRadius:0)
        bottomPath.appendPath(UIBezierPath(ovalInRect: bottomFrame))
        shapeBottomLayer.path = bottomPath.CGPath
        shapeBottomLayer.fillRule = kCAFillRuleEvenOdd
        self.bottomView.layer.mask = shapeBottomLayer
    }
}

