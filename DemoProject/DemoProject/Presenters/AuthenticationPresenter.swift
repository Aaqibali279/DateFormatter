//
//  AuthenticationPresenter.swift
//  DemoProject
//
//  Created by Aquib on 03/07/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

struct User:Decodable {
    let firstname:String
    let lastname:String
}


struct Category:Decodable {
    let name:String?
    let id:String?
}

import Foundation
import Alamofire

struct AuthenticationPresenter {
    static let instance = AuthenticationPresenter()
    private init(){}
    
    func login(email:String?,password:String?,success:@escaping Success<User>,error:@escaping ErrorMessage){
        var params = [String:Any]()
            params["email"] = email
            params["password"] = password
            params["device_token"] = "987654651545618"
            params["device_type"] = "1"
        
        Network.instance.request(endPoint: Apis.LOGIN, method: .post, parameters: params, success:success, message: error)
    }
    
    func categories(success:@escaping Success<Array<Category>>,error:@escaping ErrorMessage){
        let params = [
            "email":"aqib.ali@slinfy.com",
            "password":"123456",
            "device_token":"987654651545618",
            "device_type":"1"
        ]
        Network.instance.request(endPoint: Apis.POSTS, method: .get, parameters:params, success: { (posts:Array<Category>) in
            guard posts.count > 0 else{
                error("No posts availabel")
                return
            }
            success(posts)
        },message:error)
    }
}


