//
//  DataGame.swift
//  Core
//
//  Created by Kelvin HT on 2/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation

public struct DataGame: Decodable {
    let results: [Games]
}
public struct Game: Decodable {
    let description_raw: String
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

    let idGame: Int?
    let nameGame: String?
    let backgroundImageGame: String?
    let releasedGame: String?
    let ratingGame: Float?
    let descriptionGame: String?
}
