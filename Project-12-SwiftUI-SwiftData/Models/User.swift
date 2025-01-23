//
//  User.swift
//  Project-12-SwiftUI-SwiftData
//
//  Created by Kevin Cuadros on 21/01/25.
//

import Foundation
import SwiftData

@Model
class User {
    
    var name: String
    var city: String
    var joinDate: Date
    var jobs = [Job]()
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
    
}
