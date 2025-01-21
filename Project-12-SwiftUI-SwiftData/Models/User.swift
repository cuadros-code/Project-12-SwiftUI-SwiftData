//
//  User.swift
//  Project-12-SwiftUI-SwiftData
//
//  Created by Kevin Cuadros on 21/01/25.
//
import SwiftData
import Foundation

@Model
class User {
    
    var name: String
    var city: String
    var joinDate: Date
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
    
}
