//
//  ContentView.swift
//  68.Pr14.BucketList
//
//  Created by Валентин on 28.08.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if Bool.random() {
            Rectangle()
        } else {
            Circle()
        }
    }
}

#Preview {
    ContentView()
}
