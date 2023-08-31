//
//  Landmark.swift
//  Landmarks
//
//  Created by window1 on 2023/08/07.
//

import Foundation
import SwiftUI
import CoreLocation


struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }


    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var featureIamge: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }


    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }


    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}




//MARK: - Property Wrapper
@propertyWrapper
struct TenTimes<T: Numeric>{
    private var value: T
    var wrappedValue: T {
        get { value * 10 }
        set { value = newValue }
    }
    
    var projectedValue: T { self.value }
    
    init(wrappedValue: T) {
        self.value = wrappedValue
    }
}

struct MyNumbers {
    @TenTimes var integer: Int = 10
    @TenTimes var double: Double = 5.3
}
