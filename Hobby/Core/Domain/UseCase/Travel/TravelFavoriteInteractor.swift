//
//  TravelFavoriteProtocol.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/17/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine

class TravelFavoriteInteractor: TravelFavoriteProtocol {
    private let travelLocaleRepository: TravelLocaleRepositoryProtocol

    required init(repository: TravelLocaleRepositoryProtocol) {
      self.travelLocaleRepository = repository
    }

    func getTravelFavorite() -> AnyPublisher<[TravelModel], Error> {
        return travelLocaleRepository.getLocaleTravel()
    }
}
