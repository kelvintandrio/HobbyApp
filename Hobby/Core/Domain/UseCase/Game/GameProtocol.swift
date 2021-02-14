//
//  GameProtocol.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/10/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Combine
import Core
import Common

protocol GameProtocol {
    func getGame() -> AnyPublisher<[Core.GameModel], Common.URLError>
}
