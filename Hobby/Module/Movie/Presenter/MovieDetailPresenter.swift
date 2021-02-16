//
//  MovieDetailPresenter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Core

class MovieDetailPresenter: ObservableObject {
    private let detailUseCase: MovieDetailProtocol

    @Published var category: MovieModel
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(detailUseCase: MovieDetailProtocol) {
        self.detailUseCase = detailUseCase
        category = detailUseCase.getDetailMovie()
    }

    func addFavorite(movie: MovieEntity) {
        let statusAddFavorite = detailUseCase.addMovieFavorite(movie: movie)
        print("Status Add Favorite = \(statusAddFavorite.description)")
    }

    func checkFavorite(movie: MovieEntity) -> Bool {
        return detailUseCase.checkFavoriteMovie(movie: movie)
    }

    func deleteFavorite(movie: MovieEntity) {
        detailUseCase.deleteMovieFavorite(movie: movie)
    }
}
