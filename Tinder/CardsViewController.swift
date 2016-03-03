//
//  CardsViewController.swift
//  Tinder
//
//  Created by Justin Peng on 3/2/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var cardViewOriginalCenter: CGPoint!
    var rotation: CGFloat!
    var r2min: CGFloat!
    var r2max: CGFloat!
    
    var imageTransition: ImageTransition!

    @IBOutlet var cardViewPanGestureRecognizer: UIPanGestureRecognizer!
    @IBOutlet weak var cardView: UIImageView!
    
    @IBAction func didPanCard(sender: UIPanGestureRecognizer) {
        
        var translationx = sender.translationInView(view).x
        var translationy = sender.translationInView(view).y
        
        if sender.state == UIGestureRecognizerState.Began {
            if sender.locationInView(cardView).y < 150 {
                r2min = -45
                r2max = 45
            } else if sender.locationInView(cardView).y > 150 {
                r2min = 45
                r2max = -45
            }
        } else if sender.state == UIGestureRecognizerState.Changed {
            cardView.center.x = cardViewOriginalCenter.x + translationx
            cardView.center.y = cardViewOriginalCenter.y + translationy
            
            rotation = convertValue(translationx, r1Min: -160, r1Max: 160, r2Min: r2min, r2Max: r2max)
            cardView.transform = CGAffineTransformMakeRotation(CGFloat(Double(rotation) * M_PI / 180))
        } else if sender.state == UIGestureRecognizerState.Ended {
            if translationx > 50 {
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.cardView.center.x += 320
                })

            } else if translationx < -50 {
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.cardView.center.x -= 320
                })
                
            } else {
                cardView.transform = CGAffineTransformIdentity
                cardView.center = cardViewOriginalCenter
            }
        }
    }
    
    @IBAction func didTapCard(sender: UITapGestureRecognizer) {
        self.performSegueWithIdentifier("profileViewSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardViewOriginalCenter = cardView.center
        //cardViewPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: "didPanCard:")
        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationViewController = segue.destinationViewController as! ProfileViewController
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        imageTransition = ImageTransition()
        destinationViewController.transitioningDelegate = imageTransition
        imageTransition.duration = 1
        
        destinationViewController.profilePicture = self.cardView.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            cardView.center = cardViewOriginalCenter
            cardView.transform = CGAffineTransformIdentity
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
