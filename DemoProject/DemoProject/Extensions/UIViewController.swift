//
//  UIViewController.swift
//  DemoProject
//
//  Created by Aquib on 26/06/19.
//  Copyright © 2019 Aquib. All rights reserved.
//


struct Message {
    static let error = "Something went wrong"
    static let network = "Network not available"
}

typealias ActionHandler = (_ index:Int)->()

import UIKit
extension UIViewController {
    func viewController<T:UIViewController>() -> T {
        return UIStoryboard.init(name:"Main", bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
    
    @objc func back(){
        navigationController?.popViewController(animated: true)
    }
    
    func toast(message : String,completion: (()->())? = nil) {
        
        let label = UILabel()
        label.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = message
        label.font = .systemFont(ofSize: 18)
        label.alpha = 1.0
        label.layer.cornerRadius = 10
        label.clipsToBounds  =  true
        let height = message.height(font: label.font, width: 250) + 16
        label.frame = CGRect(x: self.view.frame.size.width/2 - 125, y: (self.view.frame.size.height/2) + 100, width: 250, height: height)
        self.view.addSubview(label)
        UIView.animate(withDuration: 4.0, delay: 1, options: .curveEaseOut, animations: {
            label.alpha = 0.0
        }, completion: {(finished) in
            label.removeFromSuperview()
            completion?()
        })
    }
    
}

