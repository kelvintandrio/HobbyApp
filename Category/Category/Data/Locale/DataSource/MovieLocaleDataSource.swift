//
//  MovieLocaleDataSource.swift
//  Category
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift
import Combine
import Core
import Common

public final class MovieLocaleDataSource: NSObject {
    public  let realmMovie: Realm?
    public init(realm: Realm?) {
        self.realmMovie = realm
    }
    public static let sharedInstance: (Realm?) -> MovieLocaleDataSource = { realmDbMovie in
        return MovieLocaleDataSource(realm: realmDbMovie)
    }
}

extension MovieLocaleDataSource: MovieLocaleDataSourceProtocol {
    public func getMovieLocale() -> AnyPublisher<[MovieEntity], Error> {
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
    public func addMovieLocale(from categories: MovieEntity) -> AnyPublisher<Bool, Error> {
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
    public func deleteMovieLocale(
        from categories: MovieEntity,
        result: @escaping (Result<Bool, DatabaseError>) -> Void
    ) {
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
    public func checkMovieLocale(from categories: MovieEntity) -> Bool {
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
