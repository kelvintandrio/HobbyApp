//
//  TravelInteractor.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/22/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Combine
import Core
import Common

class TravelInteractor: TravelProtocol {
    private let travelRepository: TravelRepositoryProtocol

    required init(repository: TravelRepositoryProtocol) {
      self.travelRepository = repository
    }

    func getTravel() -> AnyPublisher<[TravelModel], Common.URLError> {
        return travelRepository.getTravel()
    }
}
