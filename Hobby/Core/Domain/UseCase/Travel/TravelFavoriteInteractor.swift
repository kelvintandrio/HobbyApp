//
//  TravelFavoriteProtocol.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/17/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine
import Core
import Category

class TravelFavoriteInteractor: FavoriteProtocol {
    typealias Response = [TravelModel]

    private let travelLocaleRepository: TravelLocaleRepositoryProtocol

    required init(repository: TravelLocaleRepositoryProtocol) {
      self.travelLocaleRepository = repository
    }

    func getDataFavorite() -> AnyPublisher<[TravelModel], Error> {
        return travelLocaleRepository.getLocaleTravel()
    }
}
