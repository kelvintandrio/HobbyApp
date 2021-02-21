//
//  GameLocaleRepository.swift
//  Category
//
//  Created by Kelvin HT on 2/21/21.
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

extension GameLocaleRepository: LocaleRepository {
    public typealias DataModel = [GameModel]
    public typealias DataEntity = GameEntity

    public func checkLocaleData(from categories: GameEntity) -> Bool {
        return locale.checkDataLocale(from: categories)
    }
    public func deleteLocaleData(from categories: GameEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void) {
        locale.deleteDataLocale(from: categories) { deleteFavorite in
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
    public func addLocaleData(from categories: GameEntity) -> AnyPublisher<Bool, Error> {
        return self.locale.addDataLocale(from: categories)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    public func getLocaleData() -> AnyPublisher<[GameModel], Error> {
        return self.locale.getDataLocale()
            .map { DataLocaleMapper.mapGameToModel(input: $0) }
            .eraseToAnyPublisher()
    }
}
