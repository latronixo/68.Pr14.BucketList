//
//  ContentView.swift
//  68.Pr14.BucketList
//
//  Created by Валентин on 28.08.2025.
//

import MapKit
import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        Map(interactionModes: [.rotate, .zoom])
            .mapStyle(.hybrid(elevation: .realistic))
        
    }
}

#Preview {
    ContentView()
}
