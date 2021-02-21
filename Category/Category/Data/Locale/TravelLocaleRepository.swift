//
//  TravelLocaleRepository.swift
//  Category
//
//  Created by Kelvin HT on 2/21/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Common
import Core

public final class TravelLocaleRepository: NSObject {
    public typealias TravelLocaleInstance = (TravelLocaleDataSource) -> TravelLocaleRepository

    let locale: TravelLocaleDataSource

    public init(locale: TravelLocaleDataSource) {
      self.locale = locale
    }

    public static let sharedInstance: TravelLocaleInstance = { localeRepo in
      return TravelLocaleRepository(locale: localeRepo)
    }
}

extension TravelLocaleRepository: LocaleRepository {
    public typealias DataModel = [TravelModel]
    public typealias DataEntity = TravelEntity
    
    public func checkLocaleData(from categories: TravelEntity) -> Bool {
        return locale.checkDataLocale(from: categories)
    }
    public func deleteLocaleData(
        from categories: TravelEntity,
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
    public func addLocaleData(from categories: TravelEntity) -> AnyPublisher<Bool, Error> {
        return self.locale.addDataLocale(from: categories)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    public func getLocaleData() -> AnyPublisher<[TravelModel], Error> {
        return self.locale.getDataLocale()
            .map { DataLocaleMapper.mapTravelToModel(input: $0) }
            .eraseToAnyPublisher()
    }
}
