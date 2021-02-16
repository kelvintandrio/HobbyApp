//
//  SportLocaleDataSource.swift
//  Category
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Core
import Common
import Combine
import RealmSwift

public final class SportLocaleDataSource: NSObject {
    public let realmSport: Realm?
    public init(realm: Realm?) {
        self.realmSport = realm
    }
    public static let sharedInstance: (Realm?) -> SportLocaleDataSource = { realmDbSport in
        return SportLocaleDataSource(realm: realmDbSport)
    }
}

extension SportLocaleDataSource: SportLocaleDataSourceProtocol {
    public func getSportLocale() -> AnyPublisher<[SportEntity], Error> {
        return Future<[SportEntity], Error> { completion in
            if let realmSport = self.realmSport {
                let categories: Results<SportEntity> = {
                  realmSport.objects(SportEntity.self)
                    .sorted(byKeyPath: "name", ascending: true)
                }()
                completion(.success(categories.toArray(ofType: SportEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    public func addSportLocale(from categories: SportEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realmSport {
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
    public func deleteSportLocale(
        from categories: SportEntity,
        result: @escaping (Result<Bool, DatabaseError>) -> Void
    ) {
        if let realmSport = realmSport {
            do {
                try realmSport.write {
                    realmSport.delete((realmSport.object(
                        ofType: SportEntity.self,
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
    public func checkSportLocale(from categories: SportEntity) -> Bool {
        if let realmSport = realmSport {
            let sport: SportEntity? = {
                realmSport.object(ofType: SportEntity.self, forPrimaryKey: categories.id)
            }()
            if sport?.id == categories.id {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}
