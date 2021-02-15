//
//  GameLocaleRepository.swift
//  Category
//
//  Created by Kelvin HT on 2/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Core
import Common

public final class GameLocaleRepository: NSObject {
    public typealias GameLocaleInstance = (GameLocaleDataSource) -> GameLocaleRepository

    let locale: GameLocaleDataSource

    public init(locale: GameLocaleDataSource) {
      self.locale = locale
    }

    public static let sharedInstance: GameLocaleInstance = { localeRepo in
      return GameLocaleRepository(locale: localeRepo)
    }
}

extension GameLocaleRepository: GameLocaleRepositoryProtocol {
    public func checkLocaleGame(from categories: GameEntity) -> Bool {
        return locale.checkGameLocale(from: categories)
    }
    public func deleteLocaleGame(from categories: GameEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void) {
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
    public func addLocaleGame(from categories: GameEntity) -> AnyPublisher<Bool, Error> {
        return self.locale.addGameLocale(from: categories)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    public func getLocaleGame() -> AnyPublisher<[Core.GameModel], Error> {
        return self.locale.getGameLocale()
            .map { DataLocaleMapper.mapGameToModel(input: $0) }
            .eraseToAnyPublisher()
    }
}
