//
//  TravelDetailProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine

public protocol TravelDetailProtocol {
    func getDetailTravel() -> TravelModel
    func addTravelFavorite(travel: TravelEntity) -> AnyPublisher<Bool, Error>
    func checkFavoriteTravel(travel: TravelEntity) -> Bool
    func deleteTravelFavorite(travel: TravelEntity)
}
