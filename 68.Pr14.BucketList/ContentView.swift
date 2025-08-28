//
//  ContentView.swift
//  68.Pr14.BucketList
//
//  Created by Валентин on 28.08.2025.
//

import SwiftUI

struct User: Comparable, Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    //lhs - left hand side
    //rhs - right hand side
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    let users = [
        User(firstName: "Максим", lastName: "Щегловский"),
        User(firstName: "Руслан", lastName: "Мазманян"),
        User(firstName: "Юлия", lastName: "Зеленская"),
    ].sorted()
    
    var body: some View {
        List(users) { user in
            Text("\(user.lastName) \(user.firstName)")
        }
    }
}

#Preview {
    ContentView()
}
