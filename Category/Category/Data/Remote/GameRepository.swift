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

public final class GameRepository: NSObject {
    public typealias GameInstance = (GameDataSource) -> GameRepository

    let remote: GameDataSource

    public init(remote: GameDataSource) {
        self.remote = remote
    }

    public static let sharedInstance: GameInstance = { remoteRepo in
        return GameRepository(remote: remoteRepo)
    }
}

extension GameRepository: Repository {
    public typealias Response = [GameModel]
    
    public func getData() -> AnyPublisher<[GameModel], Common.URLError> {
        return self.remote.getData()
            .map { DataMapper.mapGameResponsesToDomains(input: $0) }
            .eraseToAnyPublisher()
    }
    public func getGameDescription(id: String) -> AnyPublisher<String, Common.URLError> {
        return self.remote.getGameDescription(id: id)
            .map { $0 }
            .eraseToAnyPublisher()
    }
}
