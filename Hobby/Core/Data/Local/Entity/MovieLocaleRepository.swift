//
//  MovieLocaleRepository.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/17/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine

protocol MovieLocaleRepositoryProtocol {
    func getLocaleMovie() -> AnyPublisher<[MovieModel], Error>
    func addLocaleMovie(from categories: MovieEntity) -> AnyPublisher<Bool, Error>
    func deleteLocaleMovie(from categories: MovieEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkLocaleMovie(from categories: MovieEntity) -> Bool
}

final class MovieLocaleRepository: NSObject {
    typealias MovieLocaleInstance = (MovieLocaleDataSource) -> MovieLocaleRepository

    fileprivate let locale: MovieLocaleDataSource

    private init(locale: MovieLocaleDataSource) {
      self.locale = locale
    }

    static let sharedInstance: MovieLocaleInstance = { localeRepo in
      return MovieLocaleRepository(locale: localeRepo)
    }
}

extension MovieLocaleRepository: MovieLocaleRepositoryProtocol {
    func checkLocaleMovie(from categories: MovieEntity) -> Bool {
        return locale.checkMovieLocale(from: categories)
    }
    func deleteLocaleMovie(from categories: MovieEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void) {
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
    func addLocaleMovie(from categories: MovieEntity) -> AnyPublisher<Bool, Error> {
        return self.locale.addMovieLocale(from: categories)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    func getLocaleMovie() -> AnyPublisher<[MovieModel], Error> {
        return self.locale.getMovieLocale()
            .map { DataLocaleMapper.mapMovieToModel(input: $0) }
            .eraseToAnyPublisher()
    }
}
