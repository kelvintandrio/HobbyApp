//
//  MovieRepository.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/15/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import Combine

protocol MovieRepositoryProtocol {
    func getMovie() -> AnyPublisher<[MovieModel], URLError>
}

final class MovieRepository: NSObject {
    typealias MovieInstance = (MovieDataSource) -> MovieRepository

    fileprivate let remote: MovieDataSource

    private init(remote: MovieDataSource) {
        self.remote = remote
    }

    static let sharedInstance: MovieInstance = { remoteRepo in
        return MovieRepository(remote: remoteRepo)
    }
}

extension MovieRepository: MovieRepositoryProtocol {
    func getMovie() -> AnyPublisher<[MovieModel], URLError> {
        return self.remote.getMovie()
            .map { DataMapper.mapMovieResponsesToDomains(input: $0) }
            .eraseToAnyPublisher()
    }
}
