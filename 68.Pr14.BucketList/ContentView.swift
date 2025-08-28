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
        User(firstName: "Щегловский", lastName: "Максим"),
        User(firstName: "Зенина", lastName: "Татьяна"),
        User(firstName: "Зеленская", lastName: "Юлия"),
    ].sorted()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
