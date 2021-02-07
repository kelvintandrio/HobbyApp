//
//  MovieDetailProtocol.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine

protocol MovieDetailProtocol {
    func getDetailMovie() -> MovieModel
    func addMovieFavorite(movie: MovieEntity) -> AnyPublisher<Bool, Error>
    func checkFavoriteMovie(movie: MovieEntity) -> Bool
    func deleteMovieFavorite(movie: MovieEntity)
}
