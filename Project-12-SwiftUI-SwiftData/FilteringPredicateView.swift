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
    
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    //    @Query(
    //        filter: #Predicate<User> { user in
    //            user.name.localizedStandardContains("R") &&
    //            user.city == "London"
    //        },
    //        sort: \User.name
    //    ) var users: [User]
    
    var body: some View {
        NavigationStack {
            //            List(users) { user in
            //                Text(user.name)
            //            }
            
            UsersView(
                minimumJoinDate: showingUpcomingOnly ? .now: .distantPast,
                sortOrder: sortOrder
            )
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
                    
                    Button(showingUpcomingOnly ? "Show Everyone": "Show Upcoming") {
                        showingUpcomingOnly.toggle()
                    }
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by Name")
                                .tag([
                                    SortDescriptor(\User.name),
                                    SortDescriptor(\User.joinDate),
                                ])
                            
                            Text("Sort by Join Date")
                                .tag([
                                    SortDescriptor(\User.joinDate),
                                    SortDescriptor(\User.name)
                                ])
                        }
                    }
                }
        }
    }
}

#Preview {
    FilteringPredicateView()
}
