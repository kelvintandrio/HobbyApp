//
//  MovieLocaleRepositoryProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Common

public protocol MovieLocaleRepositoryProtocol {
    func getLocaleMovie() -> AnyPublisher<[MovieModel], Error>
    func addLocaleMovie(from categories: MovieEntity) -> AnyPublisher<Bool, Error>
    func deleteLocaleMovie(from categories: MovieEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkLocaleMovie(from categories: MovieEntity) -> Bool
}
