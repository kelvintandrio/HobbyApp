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

class MovieInteractor<R: Repository>: MovieProtocol {
    private let movieRepository: R

    required init(repository: R) {
      self.movieRepository = repository
    }

    func getMovie() -> AnyPublisher<[MovieModel], Common.URLError> {
        return movieRepository.getData() as! AnyPublisher<[MovieModel], Common.URLError>
    }
}
