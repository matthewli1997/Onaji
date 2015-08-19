//
//  LoginCreationViewController.swift
//  Onaji
//
//  Created by Matthew Li on 7/23/15.
//  Copyright (c) 2015 Same. All rights reserved.
//
//  Create a new user in the database
//  

import UIKit
import Parse

class LoginCreationViewController: UIViewController
{
    @IBOutlet weak var username: UITextField!

    @IBOutlet weak var password: UITextField!
    
    //var userInfo = UserInfo()
    
    override func viewDidLoad() {
        password.secureTextEntry = true
    }
    
    @IBAction func createLogin()
    {
        let account = UserInformation()
        account.username = username.text
        account.password = password.text
		
		account.signUpInBackgroundWithBlock {(success: Bool, error: NSError?) -> Void in
            if let error = error
			{
                // Show the errorString somewhere and let the user try again.
                let errorString = error.userInfo?["error"] as? NSString
                println(error)
            }
			else
			{
                // Hooray! Let them use the app now.
                println("Account with username " + self.username.text + " has been created successfully.")
            }
        }
    }
	
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
	{
        if let touch = touches.first as? UITouch
		{
            self.view.endEditing(true)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
	{
        textField.resignFirstResponder()
        return true
    }
}
