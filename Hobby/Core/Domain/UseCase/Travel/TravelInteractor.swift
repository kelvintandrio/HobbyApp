//
//  TravelInteractor.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/22/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Combine

class TravelInteractor: TravelProtocol {
    private let travelRepository: TravelRepositoryProtocol

    required init(repository: TravelRepositoryProtocol) {
      self.travelRepository = repository
    }

    func getTravel() -> AnyPublisher<[TravelModel], URLError> {
        return travelRepository.getTravel()
    }
}
