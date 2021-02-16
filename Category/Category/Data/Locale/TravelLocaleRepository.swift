//
//  TravelLocaleRepository.swift
//  Category
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Common
import Core
import Combine

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

extension TravelLocaleRepository: TravelLocaleRepositoryProtocol {
    public func checkLocaleTravel(from categories: TravelEntity) -> Bool {
        return locale.checkTravelLocale(from: categories)
    }
    public func deleteLocaleTravel(
        from categories: TravelEntity,
        result: @escaping (Result<Bool, DatabaseError>) -> Void
    ) {
        locale.deleteTravelLocale(from: categories) { deleteFavorite in
            switch deleteFavorite {
            case .success(let resultAdd):
                result(.success(resultAdd))
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
    public func addLocaleTravel(from categories: TravelEntity) -> AnyPublisher<Bool, Error> {
        return self.locale.addTravelLocale(from: categories)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    public func getLocaleTravel() -> AnyPublisher<[TravelModel], Error> {
        return self.locale.getTravelLocale()
            .map { DataLocaleMapper.mapTravelToModel(input: $0) }
            .eraseToAnyPublisher()
    }
}
