//
//  SignUpViewController.swift
//  CustomLaunchScreen
//
//  Created by iMac on 2/28/22.
//

import UIKit


class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
    
        // Hide the error label
        errorLabel.alpha = 0
        errorLabel.backgroundColor = UIColor(white: 0.0, alpha: 1.0)
        errorLabel.layer.masksToBounds = true
        errorLabel.layer.cornerRadius = 10
    
        // Style the elements
        Utilities.styleTextField(firstNameTextField, placeHolderString: "first name")
        Utilities.styleTextField(lastNameTextField, placeHolderString: "last name")
        Utilities.styleTextField(emailTextField, placeHolderString: "email")
        Utilities.styleTextField(passwordTextField, placeHolderString: "password")
        Utilities.styleFilledButton(signUpButton)
    }
    
    // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
    func validateFields() -> String? {
        
        //firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        //lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        
        // Check that email and password fields are filled in
        if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please make sure email and password fields are filled in."
        }
        
        //Check if the email is a valid email
        let cleanedEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isValidEmail(email: cleanedEmail) == false {
            // email isn't proper format
            return "Please make sure your email is formatted correctly."
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isValidPassword(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters and contains a special character."
        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            var firstName: String?
            var lastName: String?
            // Create cleaned versions of the data
            if let firstNameValue = firstNameTextField?.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
                firstName = firstNameValue
            } else { firstName = "" }
            if let lastNameValue = lastNameTextField?.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
                lastName = lastNameValue
            } else { lastName = "" }
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // check if user with email already exists
            if ModelController.getUsersByEmail(email: email)!.count == 0 {
                // user does not already exist
                // Create the user
                ModelController.createUser(firstName: firstName, lastName: lastName, email: email, password: password)
                transitionLogin()
            }
            else {
                // user email already exists
                showError("That user with email: \(email) already exists.")
            }
        }
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        
        let homeViewController = self.storyboard?.instantiateViewController(identifier: "welcomeNavigation") as? UINavigationController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
     
    }
    
    func transitionLogin() {
        
        let loginViewController = self.storyboard?.instantiateViewController(identifier: "loginView") as? LoginViewController
        
        let transition = CATransition()
        transition.type = .push
        transition.duration = 0.25
        view.window?.layer.add(transition, forKey: kCATransition)
        
        view.window?.rootViewController = loginViewController
        view.window?.makeKeyAndVisible()
    }
    
}
