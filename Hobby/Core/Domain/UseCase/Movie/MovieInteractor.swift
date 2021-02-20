//
//  MovieInteractor.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/15/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Combine
import Core
import Category
import Common

class MovieInteractor<R: Repository>: MainProtocol {
    typealias Response = [MovieModel]
    
    private let movieRepository: R

    required init(repository: R) {
      self.movieRepository = repository
    }

    func getData() -> AnyPublisher<[MovieModel], Common.URLError> {
        return movieRepository.getData() as! AnyPublisher<[MovieModel], Common.URLError>
    }
}
