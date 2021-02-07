//
//  MovieLocaleDataSource.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/14/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift
import Combine

protocol MovieLocaleDataSourceProtocol: class {
    func getMovieLocale() -> AnyPublisher<[MovieEntity], Error>
    func addMovieLocale(from categories: MovieEntity) -> AnyPublisher<Bool, Error>
    func deleteMovieLocale(from categories: MovieEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkMovieLocale(from categories: MovieEntity) -> Bool
}

final class MovieLocaleDataSource: NSObject {
    private let realmMovie: Realm?
    private init(realm: Realm?) {
        self.realmMovie = realm
    }
    static let sharedInstance: (Realm?) -> MovieLocaleDataSource = { realmDbMovie in
        return MovieLocaleDataSource(realm: realmDbMovie)
    }
}

extension MovieLocaleDataSource: MovieLocaleDataSourceProtocol {
    func getMovieLocale() -> AnyPublisher<[MovieEntity], Error> {
        return Future<[MovieEntity], Error> { completion in
            if let realmMovie = self.realmMovie {
                let categories: Results<MovieEntity> = {
                  realmMovie.objects(MovieEntity.self)
                    .sorted(byKeyPath: "name", ascending: true)
                }()
                completion(.success(categories.toArray(ofType: MovieEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    func addMovieLocale(from categories: MovieEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realmMovie {
                do {
                    try realm.write {
                        realm.add(categories, update: .all)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    func deleteMovieLocale(from categories: MovieEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void) {
        if let realmMovie = realmMovie {
            do {
                try realmMovie.write {
                    realmMovie.delete((realmMovie.object(
                        ofType: MovieEntity.self,
                        forPrimaryKey: categories.id) ?? nil)!)
                    result(.success(true))
                }
            } catch {
                result(.failure(.requestFailed))
            }
        } else {
            result(.failure(.invalidInstance))
        }
    }
    func checkMovieLocale(from categories: MovieEntity) -> Bool {
        if let realmMovie = realmMovie {
            let movie: MovieEntity? = {
                realmMovie.object(ofType: MovieEntity.self, forPrimaryKey: categories.id)
            }()
            if movie?.id == categories.id {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}
