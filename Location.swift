//
//  Location.swift
//  68.Pr14.BucketList
//
//  Created by Валентин on 29.08.2025.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    var longitude: Double
}

