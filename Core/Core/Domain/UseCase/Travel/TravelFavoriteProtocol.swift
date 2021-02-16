//
//  TravelFavoriteProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine

public protocol TravelFavoriteProtocol {
    func getTravelFavorite() -> AnyPublisher<[TravelModel], Error>
}
