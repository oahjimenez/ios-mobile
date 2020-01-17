//
//  LocationService.swift
//  class4Tabs
//
//  Created by user164457 on 1/17/20.
//  Copyright © 2020 user164457. All rights reserved.
//

import UIKit
import CoreLocation

/// Administracion de los servicios de ubicacion del usuario
class LocationService: NSObject {
    
    private static let _shared = LocationService()
    static var shared : LocationService{
        return _shared
    }
    
    let manager = CLLocationManager()
    func permission(status:@escaping(Bool) ->Void) {
        let authorized = (CLLocationManager.authorizationStatus() == .authorizedWhenInUse)
        if authorized {
            self.manager.delegate = self
        }
        status(authorized)
    }

}


extension LocationService: CLLocationManagerDelegate {
    
}
