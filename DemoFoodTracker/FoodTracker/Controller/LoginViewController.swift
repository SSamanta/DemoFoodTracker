//
//  LoginViewController.swift
//  FoodTracker
//
//  Created by Susim Samanta on 15/06/18.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    //MARK: Parameters
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Actions
    
    @IBAction func login(_ sender: UIButton) {
        if let username = usernameField.text, let password = passwordField.text {
            if username == "admin" && password == "password" {
                // Login success
               loadMainScene()
            }else {
                //Login error
                showLoginError()
            }
        }
    }
    
    
    //MARK: UITextFieldDelegate methods
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: Login Error
    
    func showLoginError() {
        let alert = UIAlertController(title: "Login Error", message: "Wrong username or password!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: Login success
    
    func loadMainScene() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.loadMainScene()
        }
    }
}
