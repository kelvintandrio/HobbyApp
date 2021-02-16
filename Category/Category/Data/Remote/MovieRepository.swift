//
//  MovieRepository.swift
//  Category
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Common
import Core

public final class MovieRepository: NSObject {
    public typealias MovieInstance = (MovieDataSource) -> MovieRepository

    let remote: MovieDataSource

    public init(remote: MovieDataSource) {
        self.remote = remote
    }

    public static let sharedInstance: MovieInstance = { remoteRepo in
        return MovieRepository(remote: remoteRepo)
    }
}

extension MovieRepository: MovieRepositoryProtocol {
    public func getMovie() -> AnyPublisher<[MovieModel], Common.URLError> {
        return self.remote.getMovie()
            .map { DataMapper.mapMovieResponsesToDomains(input: $0) }
            .eraseToAnyPublisher()
    }
}
