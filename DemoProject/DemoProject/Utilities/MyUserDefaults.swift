//
//  MyUserDefaults.swift
//  DemoProject
//
//  Created by Aquib on 27/06/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import Foundation
struct MyUserDefaults {
    
    static let instance = MyUserDefaults()
    private init(){}
    
    private let USERNAME = "username"
    
    let defaults = UserDefaults.standard
    
    var username:String?{
        set{
            defaults.setValue(newValue, forKey:USERNAME)
        }
        get{
            return defaults.string(forKey: USERNAME)
        }
    }
    
}
