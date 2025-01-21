//
//  Project_12_SwiftUI_SwiftDataApp.swift
//  Project-12-SwiftUI-SwiftData
//
//  Created by Kevin Cuadros on 20/01/25.
//
import SwiftData
import SwiftUI

@main
struct Project_12_SwiftUI_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
