//
//  ContentView.swift
//  68.Pr14.BucketList
//
//  Created by Валентин on 28.08.2025.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    let users = [
        User(firstName: "Максим", lastName: "Щегловский"),
        User(firstName: "Татьяна", lastName: "Зенина"),
        User(firstName: "Юлия", lastName: "Зеленская"),
    ].sorted() {
        $0.lastName < $1.lastName
    }
    
    var body: some View {
        List(users) { user in
            Text("\(user.lastName) \(user.firstName)")
        }
    }
}

#Preview {
    ContentView()
}
