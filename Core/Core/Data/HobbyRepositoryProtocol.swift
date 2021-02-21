//
//  HobbyRepositoryProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/21/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Common
import Combine

public protocol HobbyRepositoryProtocol {
    func getGameDescription(id: String) -> AnyPublisher<String, Common.URLError>
}
