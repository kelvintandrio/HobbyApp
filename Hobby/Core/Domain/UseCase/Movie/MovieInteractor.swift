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

class MovieInteractor<Response, R: MovieRepositoryProtocol>: MovieProtocol
where R.Response == Response {
    private let movieRepository: R

    required init(repository: R) {
      self.movieRepository = repository
    }

    func getMovie() -> AnyPublisher<[MovieModel], Common.URLError> {
        return movieRepository.getMovie()
    }
}
