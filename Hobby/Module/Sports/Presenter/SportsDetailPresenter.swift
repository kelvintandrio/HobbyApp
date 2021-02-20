//
//  SportsDetailPresenter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/8/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Core
import Combine
import Category

class SportsDetailPresenter: ObservableObject {
    private let detailUseCase: SportsDetailProtocol

    @Published var category: SportModel
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(detailUseCase: SportsDetailProtocol) {
        self.detailUseCase = detailUseCase
        category = detailUseCase.getDetailSport()
    }

    func addFavorite(sport: SportEntity) {
        let statusAddFavorite = detailUseCase.addSportFavorite(sport: sport)
        print("Status Add Favorite = \(statusAddFavorite.description)")
    }

    func checkFavorite(sport: SportEntity) -> Bool {
        return detailUseCase.checkFavoriteSport(sport: sport)
    }

    func deleteFavorite(sport: SportEntity) {
        detailUseCase.deleteSportFavorite(sport: sport)
    }
}
