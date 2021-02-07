//
//  TravelDetailProtocol.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine

protocol TravelDetailProtocol {
    func getDetailTravel() -> TravelModel
    func addTravelFavorite(travel: TravelEntity) -> AnyPublisher<Bool, Error>
    func checkFavoriteTravel(travel: TravelEntity) -> Bool
    func deleteTravelFavorite(travel: TravelEntity)
}
