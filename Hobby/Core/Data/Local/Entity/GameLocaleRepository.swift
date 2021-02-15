//
//  GameLocaleRepository.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Core

protocol GameLocaleRepositoryProtocol {
    func getLocaleGame() -> AnyPublisher<[Core.GameModel], Error>
    func addLocaleGame(from categories: GameEntity) -> AnyPublisher<Bool, Error>
    func deleteLocaleGame(from categories: GameEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkLocaleGame(from categories: GameEntity) -> Bool
}

final class GameLocaleRepository: NSObject {
    typealias GameLocaleInstance = (GameLocaleDataSource) -> GameLocaleRepository

    fileprivate let locale: GameLocaleDataSource

    private init(locale: GameLocaleDataSource) {
      self.locale = locale
    }

    static let sharedInstance: GameLocaleInstance = { localeRepo in
      return GameLocaleRepository(locale: localeRepo)
    }
}

extension GameLocaleRepository: GameLocaleRepositoryProtocol {
    func checkLocaleGame(from categories: GameEntity) -> Bool {
        return locale.checkGameLocale(from: categories)
    }
    func deleteLocaleGame(from categories: GameEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void) {
        locale.deleteGameLocale(from: categories) { deleteFavorite in
            switch deleteFavorite {
            case .success(let resultAdd):
                print("Success Delete Game Favorite")
                result(.success(resultAdd))
            case .failure(let error):
                print("Failed Delete Game Favorite")
                result(.failure(error))
            }
        }
    }
    func addLocaleGame(from categories: GameEntity) -> AnyPublisher<Bool, Error> {
        return self.locale.addGameLocale(from: categories)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    func getLocaleGame() -> AnyPublisher<[Core.GameModel], Error> {
        return self.locale.getGameLocale()
            .map { DataLocaleMapper.mapGameToModel(input: $0) }
            .eraseToAnyPublisher()
    }
}
