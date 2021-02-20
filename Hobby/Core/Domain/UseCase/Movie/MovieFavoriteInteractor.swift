//
//  MovieFavoriteInteractor.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/17/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine
import Core
import Category

class MovieFavoriteInteractor: MovieFavoriteProtocol {
    typealias Response = [MovieModel]
    
    private let movieLocaleRepository: MovieLocaleRepositoryProtocol

    required init(repository: MovieLocaleRepositoryProtocol) {
      self.movieLocaleRepository = repository
    }

    func getMovieFavorite() -> AnyPublisher<[MovieModel], Error> {
        return movieLocaleRepository.getLocaleMovie()
    }
}
