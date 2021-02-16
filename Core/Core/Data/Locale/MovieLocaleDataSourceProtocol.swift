//
//  MovieLocaleDataSourceProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Common

public protocol MovieLocaleDataSourceProtocol: class {
    func getMovieLocale() -> AnyPublisher<[MovieEntity], Error>
    func addMovieLocale(from categories: MovieEntity) -> AnyPublisher<Bool, Error>
    func deleteMovieLocale(from categories: MovieEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkMovieLocale(from categories: MovieEntity) -> Bool
}
