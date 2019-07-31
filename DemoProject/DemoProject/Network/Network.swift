//
//  Network.swift
//  DemoProject
//
//  Created by Aquib on 26/06/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

typealias Success<Element:Decodable> = (_ success:Element) -> ()
typealias ErrorMessage = (_ message:String) -> ()

import Foundation
import Alamofire


struct Status<Element:Decodable>:Decodable {
    let status:Int
    let message:String
    let user:Element?
}

struct Network {
    
    static let instance = Network()
    private init(){}
    
    func request<Element:Decodable>(endPoint:String, method:HTTPMethod, parameters: [String: Any]? = nil,headers:[String:String]? = nil, showIndicator: Bool = true, success: Success<Element>? = nil, message:ErrorMessage? = nil) {
        
        if !NetworkReachabilityManager()!.isReachable {
            message?(Message.network)
            return
        }
        
        let urlString = Apis.BASE_URL + endPoint
        debugPrint("********************************* API Request**************************************")
        debugPrint("Request URL: ",urlString)
        debugPrint("Request Parameters: ",parameters ?? "no parameters")
        debugPrint("Request Headers: ",headers ?? "no headers")
        debugPrint("************************************************************************************")
        
        guard let url = URL(string: urlString) else{
            message?(Message.error)
            return
        }
        if showIndicator {
            Indicator.instance.show()
        }
        
        Alamofire.request(url
            , method: method
            , parameters: parameters
            , encoding: URLEncoding.default
            , headers: headers).responseData { (dataResponse) in
                
                if showIndicator {
                    DispatchQueue.main.async {
                        Indicator.instance.hide()
                    }
                }
                
                if let error = dataResponse.error{
                    message?(error.localizedDescription)
                    return
                }
                
                guard let data = dataResponse.data else{
                    message?(Message.error)
                    return
                }
                
                debugPrint("********************************* RESPONSE START **************************************")
                
                let json = String(data: data, encoding: .utf8)
                debugPrint("JSON: ",json ?? "No json")
                
                do{
                    let status = try JSONDecoder().decode(Status<Element>.self, from: data)
                    switch status.status{
                    case 200:
                        guard let user = status.user else{
                            message?(status.message)
                            return
                        }
                        success?(user)
                    default:
                        message?(status.message)
                    }
                }catch{
                    message?(Message.error)
                    debugPrint("ERROR:",error)
                }
                debugPrint("********************************* RESPONSE END **************************************")
                
        }
    }
}
