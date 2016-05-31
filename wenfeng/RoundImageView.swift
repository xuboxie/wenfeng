//
//  RoundImageView.swift
//  wenfeng
//
//  Created by BoxU on 16/5/28.
//  Copyright © 2016年 BoxU. All rights reserved.
//

import UIKit

@IBDesignable


class RoundImageView: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
        layer.cornerRadius = cornerRadius
            
        layer.masksToBounds = cornerRadius > 0
        
        }
      }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
      
        }
    }
   
    
    @IBInspectable var borderColor: UIColor?
        {
        didSet {
            layer.borderColor = borderColor?.CGColor
            
        }
    }

    
    
    

}
