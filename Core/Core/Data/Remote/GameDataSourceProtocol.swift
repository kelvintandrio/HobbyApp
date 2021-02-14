//
//  GameDataSource.swift
//  Core
//
//  Created by Kelvin HT on 2/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine

public protocol GameDataSourceProtocol: class {
    func getGame() -> AnyPublisher<[Games], URLError>
    func getGameDescription(id: String) -> AnyPublisher<String, URLError>
}
