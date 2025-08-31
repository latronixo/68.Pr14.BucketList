//
//  EditViewModel.swift
//  68.Pr14.BucketList
//
//  Created by Валентин on 31.08.2025.
//

import SwiftUI

extension EditView {
    @Observable
    class ViewModel {
        
        enum LoadingState {
            case loading, loaded, failed
        }

        var location: Location
     
        var name: String
        var description: String
        
        var loadingState = LoadingState.loading
        var pages = [Page]()
        
        init(location: Location) {
            self.location = location
            
            self.name = location.name
            self.description = location.description
        }
        
        func createNewLocation() -> Location {
            var newLocation = location
            newLocation.id = UUID()
            newLocation.name = name
            newLocation.description = description
            return newLocation
        }
        
        func fetchNearByPlaces() async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            
            guard let url = URL(string: urlString) else {
                print("Bad URL: \(urlString)")
                return
            }
            
            do {
                let (data, error) = try await URLSession.shared.data(from: url)
                print("Failed to decode1 \(error)")
                let items = try JSONDecoder().decode(Result.self, from: data)
                pages = items.query.pages.values.sorted()
                loadingState = .loaded
            } catch {
                print("Failed to decode2 \(error)")
                loadingState = .failed
            }
        }

    }
}
