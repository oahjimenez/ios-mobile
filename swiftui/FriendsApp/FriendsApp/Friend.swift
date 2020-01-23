//
//  Friend.swift
//  FriendsApp
//
//  Created by user164457 on 1/23/20.
//  Copyright © 2020 user164457. All rights reserved.
//

import Foundation
import SwiftUI

struct FriendsUI : Identifiable {
    var id = UUID()
    var name: String
    var rut: String
    var isPremium: Bool
}
