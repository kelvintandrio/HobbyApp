//
//  SportLocaleRepository.swift
//  Hobby
//
//  Created by Kelvin HT on 2/17/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Common
import Category

protocol SportLocaleRepositoryProtocol {
    func getLocaleSport() -> AnyPublisher<[SportModel], Error>
    func addLocaleSport(from categories: SportEntity) -> AnyPublisher<Bool, Error>
    func deleteLocaleSport(from categories: SportEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkLocaleSport(from categories: SportEntity) -> Bool
}
final class SportLocaleRepository: NSObject {
    public typealias SportLocaleInstance = (SportLocaleDataSource) -> SportLocaleRepository

    let locale: SportLocaleDataSource

    public init(locale: SportLocaleDataSource) {
      self.locale = locale
    }

    public static let sharedInstance: SportLocaleInstance = { localeRepo in
      return SportLocaleRepository(locale: localeRepo)
    }
}

extension SportLocaleRepository: SportLocaleRepositoryProtocol {
    func checkLocaleSport(from categories: SportEntity) -> Bool {
        return locale.checkSportLocale(from: categories)
    }
    func deleteLocaleSport(
        from categories: SportEntity,
        result: @escaping (Result<Bool, DatabaseError>) -> Void
    ) {
        locale.deleteSportLocale(from: categories) { deleteFavorite in
            switch deleteFavorite {
            case .success(let resultAdd):
                result(.success(resultAdd))
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
    func addLocaleSport(from categories: SportEntity) -> AnyPublisher<Bool, Error> {
        return self.locale.addSportLocale(from: categories)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    func getLocaleSport() -> AnyPublisher<[SportModel], Error> {
        return self.locale.getSportLocale()
            .map { DataLocaleMapper.mapSportToModel(input: $0) }
            .eraseToAnyPublisher()
    }
}
