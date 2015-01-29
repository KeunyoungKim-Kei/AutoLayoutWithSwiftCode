//
//  ViewController.swift
//  AutoLayoutWithSwiftCode
//
//  Created by Keun young Kim on 2015. 1. 29..
//  Copyright (c) 2015년 Keun young Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let centerLabel = UILabel()
        centerLabel.backgroundColor = UIColor.yellowColor()
        centerLabel.text = "Hello Auto Layout"
        centerLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var centerXConstraint = NSLayoutConstraint(item: centerLabel,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0.0)
        let centerYConstraint = NSLayoutConstraint(item: self.view,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: centerLabel,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0.0)
        
        self.view.addSubview(centerLabel)
        
        self.view.addConstraint(centerXConstraint)
        self.view.addConstraint(centerYConstraint)
        
        let updateButton = UIButton()
        updateButton.backgroundColor = UIColor.redColor()
        updateButton.setTitle("Update", forState: UIControlState.Normal)
        updateButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.view.addSubview(updateButton)
        
        var views:[NSObject: AnyObject] = ["updateButton": updateButton]
        
        centerXConstraint = NSLayoutConstraint(item: updateButton,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0.0)
        
        var horzConstraints = NSLayoutConstraint.constraintsWithVisualFormat("[updateButton(100)]",
            options: NSLayoutFormatOptions.allZeros,
            metrics: nil,
            views: views)
        var vertConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[updateButton(50)]-10-|",
            options: NSLayoutFormatOptions.allZeros,
            metrics: nil,
            views: views)
        
        updateButton.addConstraints(horzConstraints)
        self.view.addConstraint(centerXConstraint)
        self.view.addConstraints(vertConstraints)
        
        for theConstraint in self.view.constraints() {
            // ...
        }
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor.redColor()
        lineView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.view.addSubview(lineView)
        
        views = ["centerLabel": centerLabel, "lineView": lineView]
        
        horzConstraints = NSLayoutConstraint.constraintsWithVisualFormat("[lineView(==centerLabel)]",
            options: NSLayoutFormatOptions.allZeros,
            metrics: nil,
            views: views)
        
        let metrics = ["margin":NSNumber(integer: 5), "lineViewHeight":NSNumber(integer: 4)]
        vertConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[centerLabel]-margin-[lineView(lineViewHeight)]",
            options: NSLayoutFormatOptions.AlignAllCenterX,
            metrics: metrics,
            views: views)
        
        self.view.addConstraints(horzConstraints)
        self.view.addConstraints(vertConstraints)
    }

}

