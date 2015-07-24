//
//  UserInfo.swift
//  Onaji
//
//  Created by Matthew Li on 7/23/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import Foundation

class UserInfo {
    let storage = NSUserDefaults.standardUserDefaults()
    
    var userLoginInfo = [String:String]()
    
    func addUser(newUserName: String, newPassword: String) {
        userLoginInfo[newUserName] = newPassword
    }
    func testLogin(username: String, password: String) -> Bool {
        if userLoginInfo[username] == password {
            return true
        }
        return false
        
    }

}
