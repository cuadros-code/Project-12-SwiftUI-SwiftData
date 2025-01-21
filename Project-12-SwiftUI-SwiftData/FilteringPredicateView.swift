//
//  FilteringPredicateView.swift
//  Project-12-SwiftUI-SwiftData
//
//  Created by Kevin Cuadros on 21/01/25.
//

import SwiftUI
import SwiftData

struct FilteringPredicateView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(
        filter: #Predicate<User> { user in
            user.name.localizedStandardContains("R") &&
            user.city == "London"
        },
        sort: \User.name
    ) var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                Text(user.name)
            }
            .navigationTitle("Users")
            
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    
                    // Delete All Data
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(
                        name: "Ed Sheeran",
                        city: "London",
                        joinDate: .now.addingTimeInterval(86400 * -10)
                    )
                    let second = User(
                        name: "Rosa Diaz",
                        city: "New york",
                        joinDate: .now.addingTimeInterval(86400 * -5)
                    )
                    let third = User(
                        name: "Kevin Cuadros",
                        city: "Cali",
                        joinDate: .now.addingTimeInterval(86400 * 5)
                    )
                    let fourth = User(
                        name: "Jhonny English",
                        city: "London",
                        joinDate: .now.addingTimeInterval(86400 * 10)
                    )
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
            }
        }
    }
}

#Preview {
    FilteringPredicateView()
}
