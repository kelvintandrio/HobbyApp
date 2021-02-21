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

class SportsDetailPresenter<DataModel, DataEntity, U: DetailProtocol>: ObservableObject
where U.DataEntity == DataEntity {

    private let detailUseCase: U

    @Published var category: DataModel
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(detailUseCase: U, category: DataModel) {
        self.detailUseCase = detailUseCase
        self.category = category
    }

    func addFavorite(sport: DataEntity) {
        let statusAddFavorite = detailUseCase.addDataFavorite(data: sport)
        print("Status Add Favorite = \(statusAddFavorite.description)")
    }

    func checkFavorite(sport: DataEntity) -> Bool {
        return detailUseCase.checkFavoriteData(data: sport)
    }

    func deleteFavorite(sport: DataEntity) {
        detailUseCase.deleteDataFavorite(data: sport)
    }
}
