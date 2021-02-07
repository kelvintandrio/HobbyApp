//
//  GameRepository.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/11/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import Combine

protocol GameRepositoryProtocol {
    func getGame() -> AnyPublisher<[GameModel], URLError>
    func getGameDescription(id: String) -> AnyPublisher<String, URLError>
}

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
    func getGame() -> AnyPublisher<[GameModel], URLError> {
        return self.remote.getGame()
            .map { DataMapper.mapGameResponsesToDomains(input: $0) }
            .eraseToAnyPublisher()
    }
    func getGameDescription(id: String) -> AnyPublisher<String, URLError> {
        return self.remote.getGameDescription(id: id)
            .map { $0 }
            .eraseToAnyPublisher()
    }
}
