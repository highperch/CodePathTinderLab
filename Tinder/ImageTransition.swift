//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    var transitionImageView: UIImageView!
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        transitionImageView = UIImageView(frame: CGRect(x: 10, y: 75, width: 300, height: 300))
        transitionImageView.image = UIImage(named: "ryan")
        
        var transitionImageTransform = CGAffineTransformMakeScale(16/15, 16/15)
        
        toViewController.view.alpha = 0
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            self.transitionImageView.transform = transitionImageTransform
            self.transitionImageView.transform = CGAffineTransformTranslate(transitionImageTransform, -10, 0)
        }) { (finished: Bool) -> Void in
            self.transitionImageView.removeFromSuperview()
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        transitionImageView = UIImageView(frame: CGRect(x: 0, y: 75, width: 320, height: 320))
        transitionImageView.image = UIImage(named: "ryan")
        
        var transitionImageTransform = CGAffineTransformMakeScale(15/16, 15/16)
        
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            self.transitionImageView.transform = transitionImageTransform
            self.transitionImageView.transform = CGAffineTransformTranslate(transitionImageTransform, 10, 0)
        }) { (finished: Bool) -> Void in
            self.transitionImageView.removeFromSuperview()
            self.finish()
        }
    }
}
