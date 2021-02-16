//
//  MovieLocaleRepository.swift
//  Category
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Core
import Common

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

extension MovieLocaleRepository: MovieLocaleRepositoryProtocol {
    public func checkLocaleMovie(from categories: MovieEntity) -> Bool {
        return locale.checkMovieLocale(from: categories)
    }
    public func deleteLocaleMovie(
        from categories: MovieEntity,
        result: @escaping (Result<Bool, DatabaseError>) -> Void
    ) {
        locale.deleteMovieLocale(from: categories) { deleteFavorite in
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
    public func addLocaleMovie(from categories: MovieEntity) -> AnyPublisher<Bool, Error> {
        return self.locale.addMovieLocale(from: categories)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    public func getLocaleMovie() -> AnyPublisher<[MovieModel], Error> {
        return self.locale.getMovieLocale()
            .map { DataLocaleMapper.mapMovieToModel(input: $0) }
            .eraseToAnyPublisher()
    }
}
