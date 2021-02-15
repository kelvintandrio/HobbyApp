//
//  MovieDetailProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine

public protocol MovieDetailProtocol {
    func getDetailMovie() -> MovieModel
    func addMovieFavorite(movie: MovieEntity) -> AnyPublisher<Bool, Error>
    func checkFavoriteMovie(movie: MovieEntity) -> Bool
    func deleteMovieFavorite(movie: MovieEntity)
}
