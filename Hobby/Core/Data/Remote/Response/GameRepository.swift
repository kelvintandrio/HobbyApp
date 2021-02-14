//
//  GameRepository.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/11/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import Combine

protocol GameRepositoryProtocol {
    func getGame() -> AnyPublisher<[GameModel], URLError>
    func getGameDescription(id: String) -> AnyPublisher<String, URLError>
}
