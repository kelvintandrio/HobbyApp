//
//  GameLocaleRepositoryProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Common

public protocol GameLocaleRepositoryProtocol {
    func getLocaleGame() -> AnyPublisher<[Core.GameModel], Error>
    func addLocaleGame(from categories: GameEntity) -> AnyPublisher<Bool, Error>
    func deleteLocaleGame(from categories: GameEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkLocaleGame(from categories: GameEntity) -> Bool
}
