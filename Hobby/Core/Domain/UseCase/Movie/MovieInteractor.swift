//
//  MovieInteractor.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/15/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Combine
import Core
import Common

class MovieInteractor: MovieProtocol {
    private let movieRepository: MovieRepositoryProtocol

    required init(repository: MovieRepositoryProtocol) {
      self.movieRepository = repository
    }

    func getMovie() -> AnyPublisher<[MovieModel], Common.URLError> {
        return movieRepository.getMovie()
    }
}
