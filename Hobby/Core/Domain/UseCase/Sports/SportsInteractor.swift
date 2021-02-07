//
//  SportsInteractor.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/22/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Combine

class SportsInteractor: SportsProtocol {
    private let sportRepository: SportRepositoryProtocol

    required init(repository: SportRepositoryProtocol) {
      self.sportRepository = repository
    }

    func getSport() -> AnyPublisher<[SportModel], URLError> {
        return sportRepository.getSport()
    }
}
