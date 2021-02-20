//
//  GameModel.swift
//  Category
//
//  Created by Kelvin HT on 2/20/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation

public struct GameModel: Equatable, Identifiable {
    public let id: Int
    public let name: String
    public let image: String

    public let released: String
    public let rating: Float
    public let description: String

    public init(id: Int, name: String, image: String, released: String, rating: Float, description: String) {
        self.id = id
        self.name = name
        self.image = image
        self.released = released
        self.rating = rating
        self.description = description
    }
}
