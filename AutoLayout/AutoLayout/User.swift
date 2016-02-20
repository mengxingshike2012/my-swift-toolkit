//
//  User.swift
//  AutoLayout
//
//  Created by windfantasy on 16/1/9.
//  Copyright © 2016年 windfantasy. All rights reserved.
//

import Foundation

struct User {
    let name: String
    let company: String
    let login: String
    let password: String
    
    static func login(login: String, password:String) -> User? {
        if let user = database[login] {
            if user.password == password {
                return user
            }
        }
        return nil
    }
    
    static let database: Dictionary<String,User> = {
        var theDataBase = Dictionary<String, User>()
        for user in [
            User(name: "John", company: "oocl", login: "gaojo", password: "Tuesday2"),
            User(name: "Karl", company: "oocl", login: "zhouka3", password: "Tuesday2"),
            User(name: "Lance", company: "oocl", login: "wangla4", password: "Tuesday2"),
            User(name: "Jacky", company: "oocl", login: "guoja", password: "Tuesday2")] {
            theDataBase[user.login] = user
        }
        return theDataBase;
    }()
}
