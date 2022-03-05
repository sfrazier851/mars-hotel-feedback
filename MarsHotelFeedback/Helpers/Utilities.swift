//
//  Helpers.swift
//  CustomLaunchScreen
//
//  Created by iMac on 2/28/22.
//
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField, placeHolderString:String) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 7, width: textfield.frame.width, height: 8)
        
        bottomLine.backgroundColor = UIColor.init(red: 93/255, green: 163/255, blue: 216/255, alpha: 1).cgColor
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 30)
        ]
        textfield.attributedPlaceholder = NSAttributedString(string: placeHolderString, attributes: attributes)
        
        //(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        textfield.layer.cornerRadius = 10.0
        
        textfield.backgroundColor =  UIColor.black
        //white.withAlphaComponent(CGFloat(0.75))
        textfield.font = UIFont(name: "Bold", size: 45)
        textfield.textColor = UIColor.white
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 93/255, green: 163/255, blue: 216/255, alpha: 0.7)
        
        //(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        
        button.layer.cornerRadius = 25.0
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.tintColor = UIColor.black
        //UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.init(red: 226/255, green: 92/255, blue: 176/255, alpha: 0.45).cgColor
            //UIColor.black.cgColor
        button.backgroundColor = UIColor.init(red: 226/255, green: 92/255, blue: 176/255, alpha: 0.7)
        button.layer.cornerRadius = 25.0
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
}