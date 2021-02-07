//
//  GameInteractor.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/10/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Combine

class GameInteractor: GameProtocol {
    private let gameRepository: GameRepositoryProtocol

    required init(repository: GameRepositoryProtocol) {
      self.gameRepository = repository
    }

    func getGame() -> AnyPublisher<[GameModel], URLError> {
        return gameRepository.getGame()
    }
}
