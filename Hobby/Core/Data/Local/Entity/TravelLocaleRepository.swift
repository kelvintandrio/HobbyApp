//
//  TravelLocaleRepository.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/17/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine

protocol TravelLocaleRepositoryProtocol {
    func getLocaleTravel() -> AnyPublisher<[TravelModel], Error>
    func addLocaleTravel(from categories: TravelEntity) -> AnyPublisher<Bool, Error>
    func deleteLocaleTravel(from categories: TravelEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkLocaleTravel(from categories: TravelEntity) -> Bool
}

final class TravelLocaleRepository: NSObject {
    typealias TravelLocaleInstance = (TravelLocaleDataSource) -> TravelLocaleRepository

    fileprivate let locale: TravelLocaleDataSource

    private init(locale: TravelLocaleDataSource) {
      self.locale = locale
    }

    static let sharedInstance: TravelLocaleInstance = { localeRepo in
      return TravelLocaleRepository(locale: localeRepo)
    }
}

extension TravelLocaleRepository: TravelLocaleRepositoryProtocol {
    func checkLocaleTravel(from categories: TravelEntity) -> Bool {
        return locale.checkTravelLocale(from: categories)
    }
    func deleteLocaleTravel(from categories: TravelEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void) {
        locale.deleteTravelLocale(from: categories) { deleteFavorite in
            switch deleteFavorite {
            case .success(let resultAdd):
                result(.success(resultAdd))
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
    func addLocaleTravel(from categories: TravelEntity) -> AnyPublisher<Bool, Error> {
        return self.locale.addTravelLocale(from: categories)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    func getLocaleTravel() -> AnyPublisher<[TravelModel], Error> {
        return self.locale.getTravelLocale()
            .map { DataLocaleMapper02.mapTravelToModel(input: $0) }
            .eraseToAnyPublisher()
    }
}
