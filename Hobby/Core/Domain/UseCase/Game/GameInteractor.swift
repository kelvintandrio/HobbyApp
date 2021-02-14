//
//  GameInteractor.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/10/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Combine
import Category
import Core
import Common

class GameInteractor: GameProtocol {
    private let gameRepository: GameRepositoryProtocol

    required init(repository: GameRepositoryProtocol) {
      self.gameRepository = repository
    }

    func getGame() -> AnyPublisher<[Core.GameModel], Common.URLError> {
        return gameRepository.getGame()
    }
}
