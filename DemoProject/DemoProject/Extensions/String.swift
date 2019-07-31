//
//  String.swift
//  DemoProject
//
//  Created by Aquib on 27/06/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import UIKit
extension String{
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
    func height(font:UIFont?, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height:CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.text = self
        label.sizeToFit()
        return label.frame.height
    }
    
    func width(font:UIFont, height:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: height))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.text = self
        label.sizeToFit()
        return label.frame.width
    }
    
    func date(inputFormatter formatter:Formatter) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter.rawValue
        let date = dateFormatter.date(from: self)
        print ("Print :\(String(describing: date))")
        return date
    }
}
