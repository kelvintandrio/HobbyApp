//
//  SportLocaleRepository.swift
//  Category
//
//  Created by Kelvin HT on 2/21/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Common
import Core

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

extension SportLocaleRepository: LocaleRepository {
    public typealias DataModel = [SportModel]
    public typealias DataEntity = SportEntity
    
    public func checkLocaleData(from categories: SportEntity) -> Bool {
        return locale.checkDataLocale(from: categories)
    }
    public func deleteLocaleData(
        from categories: SportEntity,
        result: @escaping (Result<Bool, DatabaseError>) -> Void
    ) {
        locale.deleteDataLocale(from: categories) { deleteFavorite in
            switch deleteFavorite {
            case .success(let resultAdd):
                result(.success(resultAdd))
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
    public func addLocaleData(from categories: SportEntity) -> AnyPublisher<Bool, Error> {
        return self.locale.addDataLocale(from: categories)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    public func getLocaleData() -> AnyPublisher<[SportModel], Error> {
        return self.locale.getDataLocale()
            .map { DataLocaleMapper.mapSportToModel(input: $0) }
            .eraseToAnyPublisher()
    }
}
