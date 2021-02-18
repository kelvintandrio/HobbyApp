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

class TravelInteractor<R: Repository>: TravelProtocol {
    private let travelRepository: R

    required init(repository: R) {
      self.travelRepository = repository
    }

    func getTravel() -> AnyPublisher<[TravelModel], Common.URLError> {
        return travelRepository.getData() as! AnyPublisher<[TravelModel], Common.URLError>
    }
}
