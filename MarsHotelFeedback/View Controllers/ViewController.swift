//
//  ViewController.swift
//  CustomLaunchScreen
//
//  Created by iMac on 2/28/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        //ModelController.resetAllCoreData()
    }
    
    func setUpElements() {
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleFilledButton(loginButton)
        
    }
}
