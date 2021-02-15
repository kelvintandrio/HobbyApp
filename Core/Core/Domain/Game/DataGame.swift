//
//  DataGame.swift
//  Core
//
//  Created by Kelvin HT on 2/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation

public struct DataGame: Decodable {
    public let results: [Games]
}
public struct Game: Decodable {
    public let description_raw: String
}

public struct Games: Decodable {
    private enum CodingKeys: String, CodingKey {
        case idGame = "id"
        case nameGame = "name"
        case backgroundImageGame = "background_image"
        case releasedGame = "released"
        case ratingGame = "rating"
        case descriptionGame = "description_raw"
    }

    public let idGame: Int?
    public let nameGame: String?
    public let backgroundImageGame: String?
    public let releasedGame: String?
    public let ratingGame: Float?
    public let descriptionGame: String?
}
