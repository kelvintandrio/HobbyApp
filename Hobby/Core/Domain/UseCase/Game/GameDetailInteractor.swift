//
//  GameDetailInteractor.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine
import Core
import Common

class GameDetailInteractor: GameDetailProtocol {
    private let gameLocaleRepository: GameLocaleRepositoryProtocol
    private let repository: GameRepositoryProtocol
    private let category: GameModel

    required init(
        repository: GameRepositoryProtocol,
        repositoryLocale: GameLocaleRepositoryProtocol,
        category: GameModel
    ) {
        self.repository = repository
        self.category = category
        self.gameLocaleRepository = repositoryLocale
    }

    func getDetailGame() -> GameModel {
        return category
    }

    func addGameFavorite(game: GameEntity) -> AnyPublisher<Bool, Error> {
        return gameLocaleRepository.addLocaleGame(from: game)
    }

    func deleteGameFavorite(game: GameEntity) {
        gameLocaleRepository.deleteLocaleGame(from: game) { _ in
            print("Delete Game Favorite")
        }
    }

    func checkFavoriteGame(game: GameEntity) -> Bool {
        return gameLocaleRepository.checkLocaleGame(from: game)
    }

    func getGameDescription(id: String) -> AnyPublisher<String, Common.URLError> {
        return repository.getGameDescription(id: id)
    }
}
