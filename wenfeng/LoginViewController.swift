//
//  LoginViewController.swift
//  wenfeng
//
//  Created by BoxU on 16/5/28.
//  Copyright © 2016年 BoxU. All rights reserved.
//

import UIKit

//extension UIView {
//
////    @IBInspectable var cornerRadius: CGFloat{
////    
////        get {
////        
////           return layer.cornerRadius
////            
////        
////        
////        }
////        
////        set {
////          
////           layer.cornerRadius = newValue
////            layer.masksToBounds = (newValue > 0)
////            
////        
////        
////        
////        }
//    
//    
//    }





class LoginViewController: UIViewController, RCAnimatedImagesViewDelegate  {
 
    @IBOutlet weak var LoginStackView: UIStackView!
    
    
    @IBOutlet weak var wallpaperImagesView: RCAnimatedImagesView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.wallpaperImagesView.delegate = self
        
        self.wallpaperImagesView.startAnimating()
        
        
        
//        LoginStackView.axis = UILayoutConstraintAxis.Vertical
        // Do any additional setup after loading the view.
    }
    
    func animatedImagesNumberOfImages(animatedImagesView: RCAnimatedImagesView!) -> UInt {
        return 3
    }
    
    func animatedImagesView(animatedImagesView: RCAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
        return UIImage(named: "\(index + 1)")
    }
   
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(1.5) { () -> Void in
            self.LoginStackView.axis = UILayoutConstraintAxis.Vertical
        }
        
        
        
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
