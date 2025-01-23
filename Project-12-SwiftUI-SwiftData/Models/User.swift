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
    
    // Default delete rule is .nullify thats means if I delete de User the jobs are not
    // deleted, I change de rule to .cascade means if i delete User the jobs are deleted too
    var jobs = [Job]()
    
//    @Relationship(deleteRule: .cascade) var jobs = [Job]()
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
    
}
