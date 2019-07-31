//
//  ViewController.swift
//  DemoProject
//
//  Created by Aquib on 26/06/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import UIKit
import Hero

class ViewController: UIViewController {

    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var customView: View!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AuthenticationPresenter.instance.login(email: "aqib.ali@slinfy.com",password: "123456", success: success, error: showToast)
        
        let dateString = Date().dateString(outputFormatter: .yyyy_MM_dd)
        print(dateString)
        let date = dateString.date(inputFormatter: .yyyy_MM_dd)
        print(String(describing: date))
    }
    
    private func success(user:User){
        print(user.firstname,user.lastname)
    }
 
}

extension UIViewController{
    func showToast(message:String){
        toast(message: message)
    }
}

