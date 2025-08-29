//
//  ContentView.swift
//  68.Pr14.BucketList
//
//  Created by Валентин on 28.08.2025.
//

import MapKit
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    let locations = [
        Location(name: "Букингемский дворец", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Лондонский тауэр", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        VStack {
            Map {
                ForEach(locations) { location in
                    Marker(location.name, coordinate: location.coordinate)
                }
            }
        }
     }
}

#Preview {
    ContentView()
}
