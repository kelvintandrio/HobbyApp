//
//  SportsInteractor.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/22/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Combine
import Core
import Common

class SportsInteractor<R: Repository>: SportsProtocol {
    private let sportRepository: R

    required init(repository: R) {
      self.sportRepository = repository
    }

    func getSport() -> AnyPublisher<[SportModel], Common.URLError> {
        return sportRepository.getData() as! AnyPublisher<[SportModel], Common.URLError>
    }
}
