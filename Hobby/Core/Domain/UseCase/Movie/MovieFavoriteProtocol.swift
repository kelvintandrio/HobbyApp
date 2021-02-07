//
//  MovieFavoriteProtocol.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/17/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine

protocol MovieFavoriteProtocol {
    func getMovieFavorite() -> AnyPublisher<[MovieModel], Error>
}
