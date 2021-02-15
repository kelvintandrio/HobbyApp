//
//  DataMapper.swift
//  Category
//
//  Created by Kelvin HT on 2/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Core

final class DataMapper {
    static func mapGameResponsesToDomains(input gameResponses: [Games]) -> [GameModel] {
        return gameResponses.map { result in
            return GameModel(
                id: result.idGame ?? 0,
                name: result.nameGame ?? "Unknow",
                image: result.backgroundImageGame ?? "Unknow",
                released: result.releasedGame ?? "Unknow",
                rating: result.ratingGame ?? 0.0,
                description: result.descriptionGame ?? ""
            )
        }
    }
    static func mapMovieResponsesToDomains(input movieResponses: [Movies]) -> [MovieModel] {
        return movieResponses.map { result in
            return MovieModel(
                id: result.idMovie ?? 0,
                name: result.nameMovie ?? "Unknow",
                image: result.backgroundImageMovie ?? "Unknow",
                released: result.releasedMovie ?? "Unknow",
                rating: result.ratingMovie ?? 0.0,
                description: result.descriptionMovie ?? "Unknow"
            )
        }
    }
}
