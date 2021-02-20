//
//  FavoriteProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/20/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine

public protocol FavoriteProtocol {
    associatedtype Response
    func getDataFavorite() -> AnyPublisher<Response, Error>
}
