//
//  Servicios.swift
//  class4Tabs
//
//  Created by user164457 on 1/17/20.
//  Copyright © 2020 user164457. All rights reserved.
//

import Foundation
import UIKit

class Servicios {
    private static let _shared = Servicios()
    static var shared : Servicios {
        return _shared
    }
    
}


extension UIView {
    
    func shadow(shadowColorPorcent: CGFloat){
        self.layer.shadowColor = UIColor.black.withAlphaComponent(shadowColorPorcent).cgColor
        self.layer.shadowOffset  = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        
    }
}
