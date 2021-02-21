//
//  MovieLocaleRepository.swift
//  Category
//
//  Created by Kelvin HT on 2/20/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Common
import Core

public final class MovieLocaleRepository: NSObject {
    public typealias MovieLocaleInstance = (MovieLocaleDataSource) -> MovieLocaleRepository

    let locale: MovieLocaleDataSource

    public init(locale: MovieLocaleDataSource) {
      self.locale = locale
    }

    public static let sharedInstance: MovieLocaleInstance = { localeRepo in
      return MovieLocaleRepository(locale: localeRepo)
    }
}

extension MovieLocaleRepository: LocaleRepository {
    public typealias DataModel = [MovieModel]
    public typealias DataEntity = MovieEntity

    public func checkLocaleData(from categories: MovieEntity) -> Bool {
        return locale.checkDataLocale(from: categories)
    }
    public func deleteLocaleData(
        from categories: MovieEntity,
        result: @escaping (Result<Bool, DatabaseError>) -> Void
    ) {
        locale.deleteDataLocale(from: categories) { deleteFavorite in
            switch deleteFavorite {
            case .success(let resultAdd):
                print("Success Delete Movie Favorite")
                result(.success(resultAdd))
            case .failure(let error):
                print("Failed Delete Movie Favorite")
                result(.failure(error))
            }
        }
    }
    public func addLocaleData(from categories: MovieEntity) -> AnyPublisher<Bool, Error> {
        return self.locale.addDataLocale(from: categories)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    public func getLocaleData() -> AnyPublisher<[MovieModel], Error> {
        return self.locale.getDataLocale()
            .map { DataLocaleMapper.mapMovieToModel(input: $0) }
            .eraseToAnyPublisher()
    }
}
