//
//  SportsDetailInteractor.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/8/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine

class SportDetailInteractor: SportsDetailProtocol {
    private let sportLocaleRepository: SportLocaleRepositoryProtocol
    private let repository: SportRepositoryProtocol
    private let category: SportModel

    required init(
        repository: SportRepositoryProtocol,
        repositoryLocale: SportLocaleRepositoryProtocol,
        category: SportModel
    ) {
        self.repository = repository
        self.category = category
        self.sportLocaleRepository = repositoryLocale
    }

    func getDetailSport() -> SportModel {
        return category
    }

    func addSportFavorite(sport: SportEntity) -> AnyPublisher<Bool, Error> {
        return sportLocaleRepository.addLocaleSport(from: sport)
    }

    func deleteSportFavorite(sport: SportEntity) {
        sportLocaleRepository.deleteLocaleSport(from: sport) { _ in
            print("Delete Sport Favorite")
        }
    }

    func checkFavoriteSport(sport: SportEntity) -> Bool {
        return sportLocaleRepository.checkLocaleSport(from: sport)
    }
}
