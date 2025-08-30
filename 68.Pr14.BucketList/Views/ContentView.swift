//
//  ContentView.swift
//  68.Pr14.BucketList
//
//  Created by Валентин on 28.08.2025.
//

import MapKit
import SwiftUI

struct ContentView: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center:  CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        if viewModel.isUnlocked {
            ZStack{
                MapReader { proxy in
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .simultaneousGesture(
                                        LongPressGesture()
                                            .onEnded { _ in
                                                viewModel.selectedPlace = location
                                            }
                                    )
                            }
                        }
                    }
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local){
                            viewModel.addLocation(at: coordinate)
                        }
                    }
                    .sheet(item: $viewModel.selectedPlace) { place in
                        EditView(location: place) {
                            viewModel.update(location: $0)
                        }
                    }
                    .mapStyle(viewModel.isHybrid ? .hybrid : .standard)
                }
                VStack {
                    Spacer()
                    Button("Standard/Hybrid") {
                        viewModel.toggleStandardHybrid()
                    }
                    .padding(2)
                    .background(.white)
                    .foregroundStyle(.gray)
                    .clipShape(.capsule)
                    .padding(.bottom, 10)
                }
            }
        } else {
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
        }
    }
}

#Preview {
    ContentView()
}
