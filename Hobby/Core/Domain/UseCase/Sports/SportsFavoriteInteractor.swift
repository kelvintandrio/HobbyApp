//
//  SportsFavoriteInteractor.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/17/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine
import Core
import Category

class SportFavoriteInteractor: FavoriteProtocol {
    typealias Response = [SportModel]

    private let sportLocaleRepository: SportLocaleRepositoryProtocol

    required init(repository: SportLocaleRepositoryProtocol) {
      self.sportLocaleRepository = repository
    }

    func getDataFavorite() -> AnyPublisher<[SportModel], Error> {
        return sportLocaleRepository.getLocaleSport()
    }
}
