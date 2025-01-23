//
//  Job.swift
//  Project-12-SwiftUI-SwiftData
//
//  Created by Kevin Cuadros on 23/01/25.
//

import Foundation
import SwiftData

@Model
class Job {
    var name: String
    var priority: Int
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
