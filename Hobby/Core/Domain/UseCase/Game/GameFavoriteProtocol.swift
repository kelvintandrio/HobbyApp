//
//  GameFavoriteProtocol.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine
import Core

protocol GameFavoriteProtocol {
    func getGameFavorite() -> AnyPublisher<[Core.GameModel], Error>
}
