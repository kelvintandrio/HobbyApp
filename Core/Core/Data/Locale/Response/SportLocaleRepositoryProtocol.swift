//
//  SportLocaleRepositoryProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Common

public protocol SportLocaleRepositoryProtocol {
    func getLocaleSport() -> AnyPublisher<[SportModel], Error>
    func addLocaleSport(from categories: SportEntity) -> AnyPublisher<Bool, Error>
    func deleteLocaleSport(from categories: SportEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkLocaleSport(from categories: SportEntity) -> Bool
}
