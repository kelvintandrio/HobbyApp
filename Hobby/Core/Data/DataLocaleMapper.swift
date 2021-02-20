//
//  DataLocaleMapper.swift
//  Hobby
//
//  Created by Kelvin HT on 2/17/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Core

final class DataLocaleMapper02 {
    static func mapGameToModel(input gameResponses: [GameEntity]) -> [Core.GameModel] {
        return gameResponses.map { result in
            return Core.GameModel(
                id: result.id,
                name: result.name,
                image: result.image,
                released: result.released,
                rating: result.rating,
                description: result.description
            )
        }
    }
    static func mapGameToEntity(input gameModel: Core.GameModel) -> GameEntity {
        let gameEntity = GameEntity()
        gameEntity.id = gameModel.id
        gameEntity.name = gameModel.name
        gameEntity.image = gameModel.image
        gameEntity.released = gameModel.released
        gameEntity.rating = gameModel.rating
        return gameEntity
    }
}
