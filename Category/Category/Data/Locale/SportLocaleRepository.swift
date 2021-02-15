//
//  SportLocaleRepository.swift
//  Category
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Common
import Core
import Combine

public final class SportLocaleRepository: NSObject {
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
    public func checkLocaleSport(from categories: SportEntity) -> Bool {
        return locale.checkSportLocale(from: categories)
    }
    public func deleteLocaleSport(from categories: SportEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void) {
        locale.deleteSportLocale(from: categories) { deleteFavorite in
            switch deleteFavorite {
            case .success(let resultAdd):
                result(.success(resultAdd))
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
    public func addLocaleSport(from categories: SportEntity) -> AnyPublisher<Bool, Error> {
        return self.locale.addSportLocale(from: categories)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    public func getLocaleSport() -> AnyPublisher<[SportModel], Error> {
        return self.locale.getSportLocale()
            .map { DataLocaleMapper.mapSportToModel(input: $0) }
            .eraseToAnyPublisher()
    }
}
