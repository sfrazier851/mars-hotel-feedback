//
//  LoginViewController.swift
//  CustomLaunchScreen
//
//  Created by iMac on 2/28/22.
//

import UIKit
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        
        // Place cursor in email text field
        emailTextField.becomeFirstResponder()
    }
    
    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
        // Set background color to black
        errorLabel.backgroundColor = .black //UIColor(white: 0.0, alpha: 1.0)
        // Give label border rounded edges
        errorLabel.layer.masksToBounds = true
        errorLabel.layer.cornerRadius = 5
        
        // Style the elements
        Utilities.styleTextField(emailTextField, placeHolderString: "email")
        Utilities.styleTextField(passwordTextField, placeHolderString: "password")
        Utilities.styleFilledButton(loginButton)
        
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        // Remove whitespace and new lines from email and password textfield values
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        var userToLogin: [User]? = ModelController.getUsersByEmail(email: email)
        
        if let userToLoginValue = userToLogin {
            userToLogin = userToLoginValue
            // Email or Password is left blank
            if email == "" || password == "" {
                showError("Please make sure both fields are filled in.")
              // Email is not valid email
            } else if !Utilities.isValidEmail(email: email) {
                showError("Please make sure your email is formatted correctly.")
              // User already exists
            } else if userToLogin?.count == 0 {
                showError("That user doesn't exist.")
            } else {
                // User can be created, then go to logged-in home screen
                if userToLogin?[0].password == password {
                    
                    guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate, let window = sceneDelegate.window else {
                        return
                    }
                    
                    let homeViewController = self.storyboard?.instantiateViewController(identifier: "welcomeNavigation") as? UINavigationController
                    
                    window.rootViewController = homeViewController
                    window.makeKeyAndVisible()
                    
                    UIView.transition(with: window, duration: 1.65, options: .transitionCrossDissolve, animations: nil, completion: nil)
                    
                    
                } else {
                    showError("Incorrect credentials, please try again.")
                }
            }
        }
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
}



/*
let storyboard = UIStoryboard(name: "Main", bundle: nil)
let vc = storyboard.instantiateViewController(identifier: "welcomeNavigation")

let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
sceneDelegate.window?.rootViewController = vc

let options: UIView.AnimationOptions = .transitionCrossDissolve
let duration: TimeInterval = 0.8

UIView.transition(with: sceneDelegate.window!, duration: duration, options: options, animations: {}, completion: nil)
*/
