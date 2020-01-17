//
//  BiometricService.swift
//  class4Tabs
//
//  Created by user164457 on 1/17/20.
//  Copyright © 2020 user164457. All rights reserved.
//

import Foundation
import LocalAuthentication

class BiometricsService : NSObject{
    
    private static let _shared : BiometricsService = BiometricsService()
    static var shared:BiometricsService {
        return _shared
    }
    
    private let context = LAContext()
    
    func access(text:String,completion:@escaping(Bool)->Void) {
        self.context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,error:nil)
        self.context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,localizedReason: text) { (state:Bool,_) in
            DispatchQueue.main.async {
                completion(state)
            }
            
        }
    }
}
