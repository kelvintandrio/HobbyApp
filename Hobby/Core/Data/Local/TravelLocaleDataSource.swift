//
//  TravelLocaleDataSource.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/14/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift
import Combine

protocol TravelLocaleDataSourceProtocol: class {
    func getTravelLocale() -> AnyPublisher<[TravelEntity], Error>
    func addTravelLocale(from categories: TravelEntity) -> AnyPublisher<Bool, Error>
    func deleteTravelLocale(from categories: TravelEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkTravelLocale(from categories: TravelEntity) -> Bool
}

final class TravelLocaleDataSource: NSObject {
    private let realmTravel: Realm?
    private init(realm: Realm?) {
        self.realmTravel = realm
    }
    static let sharedInstance: (Realm?) -> TravelLocaleDataSource = { realmDbTravel in
        return TravelLocaleDataSource(realm: realmDbTravel)
    }
}

extension TravelLocaleDataSource: TravelLocaleDataSourceProtocol {
    func getTravelLocale() -> AnyPublisher<[TravelEntity], Error> {
        return Future<[TravelEntity], Error> { completion in
            if let realmTravel = self.realmTravel {
                let categories: Results<TravelEntity> = {
                  realmTravel.objects(TravelEntity.self)
                    .sorted(byKeyPath: "name", ascending: true)
                }()
                completion(.success(categories.toArray(ofType: TravelEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    func addTravelLocale(from categories: TravelEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realmTravel {
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
    func deleteTravelLocale(from categories: TravelEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void) {
        if let realmTravel = realmTravel {
            do {
                try realmTravel.write {
                    realmTravel.delete((realmTravel.object(
                        ofType: TravelEntity.self,
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
    func checkTravelLocale(from categories: TravelEntity) -> Bool {
        if let realmTravel = realmTravel {
            let travel: TravelEntity? = {
                realmTravel.object(ofType: TravelEntity.self, forPrimaryKey: categories.id)
            }()
            if travel?.id == categories.id {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}
