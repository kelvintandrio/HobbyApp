//
//  SportsProtocol.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/22/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Combine

protocol SportsProtocol {
    func getSport() -> AnyPublisher<[SportModel], URLError>
}
