//
//  MovieDataSource.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/15/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import Alamofire
import Combine

protocol MovieDataSourceProtocol: class {
    func getMovie() -> AnyPublisher<[Movies], URLError>
}

final class MovieDataSource: NSObject {
    private override init() { }

    static let sharedInstance: MovieDataSource =  MovieDataSource()
}

extension MovieDataSource: MovieDataSourceProtocol {
    func getMovie() -> AnyPublisher<[Movies], URLError> {
        return Future<[Movies], URLError> { completion in
            if let url = URL(string: MovieEndpoints.Gets.nowPlaying.url) {
                AF.request(url).validate().responseDecodable(of: DataMovies.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value.results))
                    case .failure:
                        completion(.failure(.invalidResponse))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
}
