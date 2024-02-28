//
//  Landmark.swift
//  Landmarks
//
//  Created by Darian Mitchell on 2024/2/26.
//

import CoreLocation
import Foundation
import SwiftUI

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var category: Category
    
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

    var city: String
    var state: String
    var park: String
    var description: String
    var isFeatured: Bool
    var isFavorite: Bool
    
    private var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
