//
//  CustomButt.swift
//  ShoppingApp
//
//  Created by Vaibhav Gawde on 28/09/24.
//

import Foundation
import UIKit


@IBDesignable
class CustomButton : UIButton {
    
    @IBInspectable var borderWidth : CGFloat {
        set{
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat {
        set{
            layer.cornerRadius = newValue
        }
        
        get{
            return layer.cornerRadius
        }
    }
    
}
