//
//  GameLocaleDataSource.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/14/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift
import Combine

protocol GameLocaleDataSourceProtocol: class {
    func getGameLocale() -> AnyPublisher<[GameEntity], Error>
    func addGameLocale(from categories: GameEntity) -> AnyPublisher<Bool, Error>
    func deleteGameLocale(from categories: GameEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkGameLocale(from categories: GameEntity) -> Bool
}

final class GameLocaleDataSource: NSObject {
    private let realmGame: Realm?
    private init(realm: Realm?) {
        self.realmGame = realm
    }
    static let sharedInstance: (Realm?) -> GameLocaleDataSource = { realmDbGame in
        return GameLocaleDataSource(realm: realmDbGame)
    }
}

extension GameLocaleDataSource: GameLocaleDataSourceProtocol {
    func getGameLocale() -> AnyPublisher<[GameEntity], Error> {
        return Future<[GameEntity], Error> { completion in
            if let realmGame = self.realmGame {
                let categories: Results<GameEntity> = {
                  realmGame.objects(GameEntity.self)
                    .sorted(byKeyPath: "name", ascending: true)
                }()
                completion(.success(categories.toArray(ofType: GameEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    func addGameLocale(from categories: GameEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realmGame {
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
    func deleteGameLocale(from categories: GameEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void) {
        if let realmGame = realmGame {
            do {
                try realmGame.write {
                    realmGame.delete((realmGame.object(ofType: GameEntity.self, forPrimaryKey: categories.id) ?? nil)!)
                    result(.success(true))
                }
            } catch {
                result(.failure(.requestFailed))
            }
        } else {
            result(.failure(.invalidInstance))
        }
    }
    func checkGameLocale(from categories: GameEntity) -> Bool {
        if let realmGame = realmGame {
            let game: GameEntity? = {
                realmGame.object(ofType: GameEntity.self, forPrimaryKey: categories.id)
            }()
            if game?.id == categories.id {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}
