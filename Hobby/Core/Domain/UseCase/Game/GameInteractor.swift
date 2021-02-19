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

class GameInteractor<R: Repository>: GameProtocol {
    private let gameRepository: R

    required init(repository: R) {
      self.gameRepository = repository
    }

    func getGame() -> AnyPublisher<[Core.GameModel], Common.URLError> {
        return gameRepository.getData() as! AnyPublisher<[GameModel], Common.URLError>
    }
}
