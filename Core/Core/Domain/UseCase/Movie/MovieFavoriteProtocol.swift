//
//  MovieFavoriteProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine

public protocol MovieFavoriteProtocol {
    func getMovieFavorite() -> AnyPublisher<[MovieModel], Error>
}
