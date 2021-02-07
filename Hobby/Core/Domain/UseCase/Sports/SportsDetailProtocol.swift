//
//  SportDetailProtocol.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/8/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine

protocol SportsDetailProtocol {
    func getDetailSport() -> SportModel
    func addSportFavorite(sport: SportEntity) -> AnyPublisher<Bool, Error>
    func checkFavoriteSport(sport: SportEntity) -> Bool
    func deleteSportFavorite(sport: SportEntity)
}
