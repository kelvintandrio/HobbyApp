//
//  TravelDetailInteractor.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine
import Core

protocol TravelDetailProtocol {
    func getDetailTravel() -> TravelModel
    func addTravelFavorite(travel: TravelEntity) -> AnyPublisher<Bool, Error>
    func checkFavoriteTravel(travel: TravelEntity) -> Bool
    func deleteTravelFavorite(travel: TravelEntity)
}
class TravelDetailInteractor: TravelDetailProtocol {
    private let travelLocaleRepository: TravelLocaleRepositoryProtocol
    private let repository: TravelRepositoryProtocol
    private let category: TravelModel

    required init(
        repository: TravelRepositoryProtocol,
        repositoryLocale: TravelLocaleRepositoryProtocol,
        category: TravelModel
    ) {
        self.repository = repository
        self.category = category
        self.travelLocaleRepository = repositoryLocale
    }

    func getDetailTravel() -> TravelModel {
        return category
    }

    func addTravelFavorite(travel: TravelEntity) -> AnyPublisher<Bool, Error> {
        return travelLocaleRepository.addLocaleTravel(from: travel)
    }

    func deleteTravelFavorite(travel: TravelEntity) {
        travelLocaleRepository.deleteLocaleTravel(from: travel) { _ in
            print("Delete Travel Favorite")
        }
    }

    func checkFavoriteTravel(travel: TravelEntity) -> Bool {
        return travelLocaleRepository.checkLocaleTravel(from: travel)
    }
}
