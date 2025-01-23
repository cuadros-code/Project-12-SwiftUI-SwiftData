//
//  UsersView.swift
//  Project-12-SwiftUI-SwiftData
//
//  Created by Kevin Cuadros on 23/01/25.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        List(users) { user in
            HStack {
                Text(user.name)
                Spacer()
                Text(String(user.jobs.count))
                    .fontWeight(.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
        
        .onAppear(perform: addSample)
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    func addSample() {
        let user = User(name: "Julio", city: "buga", joinDate: .now)
        let job1 = Job(name: "Youtuber", priority: 3)
        let job2 = Job(name: "Enginner", priority: 4)
        
        modelContext.insert(user)
        
        user.jobs.append(job1)
        user.jobs.append(job2)
    }
}

#Preview {
    UsersView(
        minimumJoinDate: .now,
        sortOrder: [SortDescriptor(\User.name)]
    )
        .modelContainer(for: User.self)
}
