//
//  TravelModel.swift
//  Core
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation

public struct TravelModel: Equatable, Identifiable {
    public let id: Int
    public let name: String
    public let image: String

    public let latitude: Double
    public let longitude: Double
    public let descript: String
    public let address: String
    public let like: Int

    public init(
        id: Int,
        name: String,
        image: String,
        latitude: Double,
        longitude: Double,
        descript: String,
        address: String,
        like: Int
    ) {
        self.id = id
        self.name = name
        self.image = image
        self.latitude = latitude
        self.longitude = longitude
        self.descript = descript
        self.address = address
        self.like = like
    }
}
