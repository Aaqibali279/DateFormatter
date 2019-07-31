//
//  Date.swift
//  DemoProject
//
//  Created by Aquib on 27/06/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import Foundation
extension Date{
    func dateString(outputFormatter formatter:Formatter) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter.rawValue
        let dateString = dateFormatter.string(from: self)
        print ("Print :\(dateString)")
        return dateString
    }
}

enum Formatter:String{
    case yyyy_MM_dd = "yyyy-MM-dd"
    case input1 = "yyyy-MM-dd HH:mm:ss +zzzz"
}
