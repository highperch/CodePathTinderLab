//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Justin Peng on 3/2/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profilePicture: UIImage!

    @IBOutlet weak var profileView: UIImageView!
    
    @IBAction func didPressDone(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileView.image = profilePicture
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
