//
//  GameDetailProtocol.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine
import Common

protocol GameDetailProtocol {
    func getDetailGame() -> GameModel
    func getGameDescription(id: String) -> AnyPublisher<String, Common.URLError>
    func addGameFavorite(game: GameEntity) -> AnyPublisher<Bool, Error>
    func checkFavoriteGame(game: GameEntity) -> Bool
    func deleteGameFavorite(game: GameEntity)
}
