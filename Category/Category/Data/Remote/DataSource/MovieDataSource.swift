//
//  MovieDataSource.swift
//  Category
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Common
import Combine
import Alamofire
import Core

public final class MovieDataSource: NSObject {
    override init() { }

    public static let sharedInstance: MovieDataSource =  MovieDataSource()
}

extension MovieDataSource: DataSource {
    public typealias Response = [Movies]

    public func getData() -> AnyPublisher<[Movies], Common.URLError> {
        return Future<[Movies], Common.URLError> { completion in
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
