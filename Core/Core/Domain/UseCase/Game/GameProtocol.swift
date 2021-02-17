//
//  GameProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/17/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Common
import Combine

public protocol GameProtocol {
    func getGame() -> AnyPublisher<[GameModel], Common.URLError>
}
