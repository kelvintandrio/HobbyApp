//
//  MovieDetailPresenter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Category
import Core

class MovieDetailPresenter<DataModel, DataEntity, U: DetailProtocol>: ObservableObject
where U.DataEntity == DataEntity {

    private let detailUseCase: U

    @Published var category: DataModel
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(detailUseCase: U, category: DataModel) {
        self.detailUseCase = detailUseCase
        self.category = category
    }

    func addFavorite(movie: DataEntity) {
        let statusAddFavorite = detailUseCase.addDataFavorite(movie: movie)
        print("Status Add Favorite = \(statusAddFavorite.description)")
    }

    func checkFavorite(movie: DataEntity) -> Bool {
        return detailUseCase.checkFavoriteData(movie: movie)
    }

    func deleteFavorite(movie: DataEntity) {
        detailUseCase.deleteDataFavorite(movie: movie)
    }
}
