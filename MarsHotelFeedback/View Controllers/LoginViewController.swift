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

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
        
        // Style the elements
        Utilities.styleTextField(emailTextField, placeHolderString: "email")
        Utilities.styleTextField(passwordTextField, placeHolderString: "password")
        Utilities.styleFilledButton(loginButton)
        
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        // TODO: Validate Text Fields
        
        
        // Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        var userToLogin: [User]? = ModelController.getUsersByEmail(email: email)
        
        if let userToLoginValue = userToLogin {
            userToLogin = userToLoginValue
            if email == "" || password == "" {
                showError("Pleae make sure both fields are filled in.")
            } else if userToLogin?.count == 0 {
                showError("User with email: \(email), doesn't exist.")
            } else {
                if userToLogin?[0].password == password {
                    let homeViewController = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController
                    
                    self.view.window?.rootViewController = homeViewController
                    self.view.window?.makeKeyAndVisible()
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
