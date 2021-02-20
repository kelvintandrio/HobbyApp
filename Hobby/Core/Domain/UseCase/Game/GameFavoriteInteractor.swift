//
//  GameFavoriteInteractor.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine
import Core
import Category

class GameFavoriteInteractor: FavoriteProtocol {
    typealias Response = [GameModel]

    private let gameLocaleRepository: GameLocaleRepositoryProtocol

    required init(repository: GameLocaleRepositoryProtocol) {
      self.gameLocaleRepository = repository
    }

    func getDataFavorite() -> AnyPublisher<[GameModel], Error> {
        return gameLocaleRepository.getLocaleGame()
    }
}
