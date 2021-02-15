//
//  GameLocaleDataSourceProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Common

public protocol GameLocaleDataSourceProtocol: class {
    func getGameLocale() -> AnyPublisher<[GameEntity], Error>
    func addGameLocale(from categories: GameEntity) -> AnyPublisher<Bool, Error>
    func deleteGameLocale(from categories: GameEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkGameLocale(from categories: GameEntity) -> Bool
}
