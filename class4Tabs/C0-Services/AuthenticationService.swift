//
//  AuthenticationService.swift
//  class4Tabs
//
//  Created by user164457 on 1/20/20.
//  Copyright © 2020 user164457. All rights reserved.
//

import Foundation
import Alamofire

class AuthentificationService {
    private let AUTH_URL:String! = "http://www.mocky.io/v2/5e21c48a2f0000440077d907"
    private static let _shared = AuthentificationService()
    static var shared : AuthentificationService{
        return _shared
    }
    func authenticate( username:String, password:String,completion:@escaping(Bool)->Void) {
        AF.request(AUTH_URL).responseJSON { response in
            let jsonResponse = try! response.result.get()
            print(jsonResponse)
            guard let authMap = jsonResponse as? [String:AnyObject] else {
                print("error al convertir respuesta en array object")
                return
            }
        completion(self.matches(username:username,password:password,authMap: authMap))
       }
    }
    func matches(username: String, password:String, authMap:[String:AnyObject]) -> Bool {
        let authenticates: Bool! = false
        guard let userMap = authMap["user"] as? [String:AnyObject]
        else {
            return authenticates
        }
        guard let authUsername:String = userMap["name"] as? String, let authPassword = userMap["key"] as? String
        else {
            return authenticates
        }
        print("Actual: Username[\(username)] Password[\(password)] Expected: Username[\(authUsername)] Password[\(authPassword)]")
        return authUsername==username && authPassword==password
    }
}
