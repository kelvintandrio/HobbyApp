//
//  GameFavoriteProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/17/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine

public protocol GameFavoriteProtocol {
    func getGameFavorite() -> AnyPublisher<[GameModel], Error>
}
