//
//  Project_12_SwiftUI_SwiftDataApp.swift
//  Project-12-SwiftUI-SwiftData
//
//  Created by Kevin Cuadros on 20/01/25.
//

import SwiftUI
import SwiftData

@main
struct Project_12_SwiftUI_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            FilteringPredicateView()
        }
        .modelContainer(for: User.self)
    }
}
