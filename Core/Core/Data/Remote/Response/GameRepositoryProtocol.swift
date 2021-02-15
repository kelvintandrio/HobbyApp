//
//  GameRepositoryProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Common

public protocol GameRepositoryProtocol {
    func getGame() -> AnyPublisher<[GameModel], Common.URLError>
    func getGameDescription(id: String) -> AnyPublisher<String, Common.URLError>
}
