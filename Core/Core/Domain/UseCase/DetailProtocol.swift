//
//  DetailProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/21/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine

public protocol DetailProtocol {
    associatedtype DataEntity

    func addDataFavorite(movie: DataEntity) -> AnyPublisher<Bool, Error>
    func checkFavoriteData(movie: DataEntity) -> Bool
    func deleteDataFavorite(movie: DataEntity)
}
