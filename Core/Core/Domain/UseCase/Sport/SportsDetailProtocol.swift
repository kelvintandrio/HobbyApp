//
//  SportsDetailProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine

public protocol SportsDetailProtocol {
    func getDetailSport() -> SportModel
    func addSportFavorite(sport: SportEntity) -> AnyPublisher<Bool, Error>
    func checkFavoriteSport(sport: SportEntity) -> Bool
    func deleteSportFavorite(sport: SportEntity)
}
