//
//  GameRepository.swift
//  Category
//
//  Created by Kelvin HT on 2/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Core
import Common

final class GameRepository: NSObject {
    typealias GameInstance = (GameDataSource) -> GameRepository

    fileprivate let remote: GameDataSource

    private init(remote: GameDataSource) {
        self.remote = remote
    }

    static let sharedInstance: GameInstance = { remoteRepo in
        return GameRepository(remote: remoteRepo)
    }
}

extension GameRepository: GameRepositoryProtocol {
    func getGame() -> AnyPublisher<[GameModel], Common.URLError> {
        return self.remote.getGame()
            .map { DataMapper.mapGameResponsesToDomains(input: $0) }
            .eraseToAnyPublisher()
    }
    func getGameDescription(id: String) -> AnyPublisher<String, Common.URLError> {
        return self.remote.getGameDescription(id: id)
            .map { $0 }
            .eraseToAnyPublisher()
    }
}
