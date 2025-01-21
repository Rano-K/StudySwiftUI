//
//  TripModel.swift
//  27_Image_Carousel
//
//  Created by ms k on 11/20/24.
//

import SwiftUI

struct TripModel: Identifiable {
    var id = UUID()
    var destination : String
    var image : String
}

#if DEBUG
let sampleTrips = [ TripModel(destination: "Paris", image: "paris"),
                    TripModel(destination: "Florence", image: "florence"),
                    TripModel(destination: "Amsterdam", image: "amsterdam"),
                    TripModel(destination: "Ghent", image: "ghent"),
                    TripModel(destination: "Santorini", image: "santorini"),
                    TripModel(destination: "Budapest", image: "budapest"),
                    TripModel(destination: "London", image: "london"),
                    TripModel(destination: "Cuba", image: "cuba"),
                    TripModel(destination: "Osaka", image: "osaka"),
                    TripModel(destination: "Kyoto", image: "kyoto"),
                    TripModel(destination: "Seoul", image: "seoul"),
                    TripModel(destination: "Sydney", image: "sydney"),
                    TripModel(destination: "Hong Kong", image: "hongkong")
]
#endif
